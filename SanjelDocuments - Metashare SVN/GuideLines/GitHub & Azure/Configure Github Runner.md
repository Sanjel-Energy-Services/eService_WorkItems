# Configure Github Runner
Status: #Documentation 
Tags: [[Digital Resource Board]] - [[GitHub]]

---
#### HostName: BuildHost03 

#### UserName: adminuser
#### Password: 6Vsf4qYAo3uW8dGwg6TN

#### UserName: builder
#### Password: qFDEg0okLre70YXJk1vT

### Setting up a Self hosted Runner host

1. Create windows10/11 VM in Azure DEVTEST
	- https://portal.azure.com/#@sanjel.com/resource/subscriptions/b45d1831-e37e-4b8e-9d13-283717662c3c/resourceGroups/Sanjel_DevTest_Lab/providers/Microsoft.DevTestLab/labs/DevTestLab/myVMs
	- Size: D2s_v3	- 
1. Install Git
	-  [Git - Downloading Package (git-scm.com)](https://git-scm.com/download/win)
2. Install PowerShell 7
	- from MS store
	- if that doens't work then use the MSI method from here
		- https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?WT.mc_id=THOMASMAURER-blog-thmaure&view=powershell-7
	- test by ensuring you can run pwsh command
	- @PSVersionTable should show version 7	- 
3. Install Chocolatey
	- https://docs.chocolatey.org/en-us/choco/setup#more-install-options
	- @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
4. Install SQL Express
	-  [SQL Server Express LocalDB - SQL Server | Microsoft Learn](https://learn.microsoft.com/en-us/sql/database-engine/configure-windows/sql-server-express-localdb?view=sql-server-ver16#install-localdb)
5. Install SQLcmd utilities
	1. [sqlcmd Utility - SQL Server | Microsoft Learn](https://learn.microsoft.com/en-us/sql/tools/sqlcmd-utility?view=sql-server-ver16)
6. Add a builder account (regular user not admin) to the VM
7. Create self-hosted runner
	- Follow commands from github
	- https://github.com/Sanjel-Energy-Services/DigitalResourceBoard/settings/actions/runners/new
	- run the git self hosted runner service as the builder account
8. Set HOMEPATH and HOMEDRIVE environment variables
	1. these were set from code by Murray
