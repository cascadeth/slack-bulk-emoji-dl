# slack-bulk-emoji-dl
Download all emojis from your Slack team


## Getting Started

These instructions will get you a copy of the project up and running on your local machine.

### Prerequisites

What things you need to install the software and how to install them

 * A Windows or Linux based machine
 * Git installed on your Linux machine 
     * For Ubuntu/Debian based distributions: `sudo apt install git`
     * For CentOS, Fedora, Red Hat based distributions: `sudo yum install git`
     * For Windows see: https://git-scm.com/download

### Installing

A step by step series of examples that tell you how to get up and running

Clone this repository to your system:

```
$ git clone https://github.com/cascadeth/slack-bulk-emoji-dl.git
```
Change to the new directory: 
```
$ cd slack-bulk-emoji-dl
```

Set permissions if necessary:
```
$ chmod +x download_all.ps1
```

Request a Slack legacy token from: https://api.slack.com/custom-integrations/legacy-tokens
Save to the local repository directory as: `leg-api-token`

## Running 

### Windows PowerShell Execution Policy

If you haven't run PowerShell scripts before, you will need to set the execution policy to allow scripts to run on your machine.
Open a PowerShell window as an Admin and run:
```
Set-ExecutionPolicy Unrestricted
```
and select A for `Yes to All`. 

### Usage

Execute the script:
```
> .\download_all.ps1
```

When the script finishes, you should have a directory to view all the emoji images (`.\images`) and a zip file containing every
image in that directory. 

## License

This project is licensed under the GNU General Public License Version 3 - see the [LICENSE](LICENSE) file for details

