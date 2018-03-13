# EventStorePowerShell

PowerShell Module for Managing the EventStore from geteventstore.com

## Local Development

```
#list module path
$env:PSModulePath -split ';'

#adding local folder to PSModulePath
$env:PSModulePath = $env:PSModulePath + ";$(Get-Location)"

Get-Module -ListAvailable

```

## Links

http://ramblingcookiemonster.github.io/Building-A-PowerShell-Module/
https://kevinmarquette.github.io/2017-05-27-Powershell-module-building-basics/?utm_source=blog&utm_medium=blog&utm_content=psrepository