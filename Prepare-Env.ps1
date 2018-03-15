Write-Host "Setting Module Path ..."
$env:PSModulePath = $env:PSModulePath + ";$(Get-Location)"

Get-Module -ListAvailable -Name EventStoreUtil

