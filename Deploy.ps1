#script to deploy with appveyor
$env:PSModulePath = $env:PSModulePath + ";$(Get-Location)"
Update-ModuleManifest -Path .\EventStoreUtil\EventStoreUtil.psd1 -ModuleVersion $env:APPVEYOR_BUILD_VERSION
Publish-Module -Name EventStoreUtil -NuGetApiKey $env:PS_GALLERY_API_KEY