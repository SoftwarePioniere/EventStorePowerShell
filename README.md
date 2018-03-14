# EventStorePowerShell

PowerShell Module for Managing the EventStore from geteventstore.com

## Local Development

```
#list module path
$env:PSModulePath -split ';'

#adding local folder to PSModulePath
$env:PSModulePath = $env:PSModulePath + ";$(Get-Location)"

Get-Module -ListAvailable -Name EventStoreUtil

#Start Local Shell
powershell
.\Prepare-Env.ps1


#Link folder to Powershell Modules Directory

$originalPath =  "$(Get-Location)\EventStoreUtil"
$pathInModuleDir = 'C:\Program Files\WindowsPowerShell\Modules\EventStoreUtil'

New-Item -ItemType SymbolicLink -Path $pathInModuleDir -Target $originalPath

```

## Links

http://ramblingcookiemonster.github.io/Building-A-PowerShell-Module/
https://kevinmarquette.github.io/2017-05-27-Powershell-module-building-basics/?utm_source=blog&utm_medium=blog&utm_content=psrepository