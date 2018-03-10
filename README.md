# EventStorePowerShell

PowerShell Module for Managing the EventStore from geteventstore.com

## Local Development

```
Run as Administrator

#Link folder to Powershell Modules Directory

$originalPath =  "$(Get-Location)"
$pathInModuleDir = 'C:\Program Files\WindowsPowerShell\Modules\EventStorePowerShell'

New-Item -ItemType SymbolicLink -Path $pathInModuleDir -Target $originalPath

#Unlink Folder -- not wokring
Remove-Item -Path $pathInModuleDir -Force -Recurse

```

## Publishing

```
Publish-Module -Name EventStorePowerShell -NuGetApiKey <apiKey>
```

## Links

http://ramblingcookiemonster.github.io/Building-A-PowerShell-Module/