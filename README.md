# EventStorePowerShell

PowerShell Module for Managing the EventStore from eventstore.org

## Samples

```powershell
Write-Host "Setting Module Path ..."
$env:PSModulePath = $env:PSModulePath + ";$(Get-Location)"

Write-Host "Creating Credentials"

Write-Host "changeit SecureString"
$changeit = ConvertTo-SecureString "changeit" -AsPlainText -Force

Write-Host "opschangeit PSCredential"
$opschangeit = New-Object System.Management.Automation.PSCredential('ops', $changeit)

Write-Host "opschangeit Password:"
$opschangeit.UserName
$opschangeit.GetNetworkCredential().Password

Write-Host "adminchangeit PSCredential"
$adminchangeit = New-Object System.Management.Automation.PSCredential('admin', $changeit)

Write-Host "adminchangeit Password:"
$adminchangeit.UserName
$adminchangeit.GetNetworkCredential().Password

$changedit= ConvertTo-SecureString "changedit" -AsPlainText -Force
$opschangedit = New-Object System.Management.Automation.PSCredential('ops', $changedit)

# Test-EventStoreRunning
# Stop-EventStore -credential $adminchangeit
# Test-EventStoreUserHasPassword -credential $adminchangeit

# Set-EventStoreUserPassword -credential $adminchangeit -user $opschangedit
# Test-EventStoreUserHasPassword -credential $opschangedit

# Assert-EventStoreUserHasPassword -credential $adminchangeit -user $opschangedit
# Test-EventStoreUserHasPassword -credential $opschangedit
```

## Local Development

```powershell
#Start Local Shell
powershell
.\Prepare-Env.ps1

#Analyze Module
Invoke-ScriptAnalyzer -Path .\EventStoreUtil\

#list module path
$env:PSModulePath -split ';'

#adding local folder to PSModulePath
$env:PSModulePath = $env:PSModulePath + ";$(Get-Location)"

Get-Module -ListAvailable -Name EventStoreUtil

#Link folder to Powershell Modules Directory

$originalPath =  "$(Get-Location)\EventStoreUtil"
$pathInModuleDir = 'C:\Program Files\WindowsPowerShell\Modules\EventStoreUtil'

New-Item -ItemType SymbolicLink -Path $pathInModuleDir -Target $originalPath

```

## Links

* http://ramblingcookiemonster.github.io/Building-A-PowerShell-Module/
* https://kevinmarquette.github.io/2017-05-27-Powershell-module-building-basics/?utm_source=blog&utm_medium=blog&utm_content=psrepository