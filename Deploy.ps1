[CmdletBinding()]
Param(
    [string]$version = "9.9.9",
    [string]$apiKey
)

$moduleDir = "$(Get-Location)\xxModules"

if (!(Test-Path -Path $moduleDir)) {
    Write-Host "Creating Temp Modules Dir $moduleDir"
    New-Item -Path $moduleDir -ItemType Directory
}

$mod = Import-PowerShellDataFile ./EventStoreUtil/EventStoreUtil.psd1

foreach ($m in $mod.RequiredModules) {
    Write-Host "Saving Module" $m.ModuleName $m.ModuleVersion
    
    $path ="$moduleDir\$($m.ModuleName)\$($m.ModuleVersion)"
    Write-Host "Local Path" $path
    if (!(Test-Path -Path $path)) {
        Save-Module -Name $m.ModuleName -RequiredVersion $m.ModuleVersion -Path $moduleDir
    }
}

$env:PSModulePath = "$env:PSModulePath;$moduleDir";
Write-Host "Changed ModulePath" $env:PSModulePath

Write-Host "Updating Module Manifest... with Version: $version"
Update-ModuleManifest -Path .\EventStoreUtil\EventStoreUtil.psd1 -ModuleVersion $version

if ($apiKey) {
    Write-Host "Publishing Module... "
    Publish-Module -Path .\EventStoreUtil -NuGetApiKey $apiKey
}
