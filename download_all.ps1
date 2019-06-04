$token = Get-Content .\leg-api-token

$output_path = "$PSScriptRoot\images"

if (!(Test-Path "$output_path")) {

    New-Item $output_path -type Directory | Out-Null
}

function ZipFiles( $zipfilename, $sourcedir ) {
    Add-Type -Assembly System.IO.Compression.FileSystem
    $compressionLevel = [System.IO.Compression.CompressionLevel]::Optimal
    [System.IO.Compression.ZipFile]::CreateFromDirectory($sourcedir, $zipfilename, $compressionLevel, $false)
}

$api_result_JSON = Invoke-WebRequest "https://slack.com/api/emoji.list?token=$token&pretty=1"

$result = (ConvertFrom-Json $api_result_JSON)

Write-Host "   Acquired list of emojis`n   Downloading from each given URL...`n" -ForegroundColor Yellow

$emojis = $result.emoji.PSObject.Properties

foreach ($line in $emojis) {
	
	if ($line.value -like 'alias*') {
		continue
	}

	if ($line.value -like '*.jpg') {
		Invoke-WebRequest $line.value -OutFile $output_path\"$($line.name).jpg"
	}
	elseif ($line.value -like '*.png') {
		Invoke-WebRequest $line.value -OutFile $output_path\"$($line.name).png"
	}
	elseif ($line.value -like '*.gif') {
		Invoke-WebRequest $line.value -OutFile $output_path\"$($line.name).png"
	}
	else {
		Write-Host "Unrecognized file type: $($line.value)" -ForegroundColor Red
		continue
	}
}

if (Test-Path "C:\Program Files\7-Zip\7z.exe") {

	if (Test-Path "$PSScriptRoot\images.zip") {
		Remove-Item -Path "$PSScriptRoot\images.zip"
	}
	
	Write-Host "   Compressing files... " -ForegroundColor Yellow
    & "C:\Program Files\7-Zip\7z.exe" a "images.zip" ".\"
    Write-Host "`n   DONE`n" -ForegroundColor Green 
}
else {

	if (Test-Path "$PSScriptRoot\images.zip") {
		Remove-Item -Path "$PSScriptRoot\images.zip"
	}

	Write-Host "   Compressing files... " -ForegroundColor Yellow
    ZipFiles "$PSScriptRoot\images.zip" "$PSScriptRoot"
    Write-Host "`n   DONE`n" -ForegroundColor Green
}