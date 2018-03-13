Import-Module .\Test-EventStoreUserHasPassword.psm1
Import-Module .\Set-EventStoreUserPassword.psm1

function Assert-EventStoreUserHasPassword {
   
    [Cmdletbinding()]
    Param(
        [String]    $url = "http://localhost:2113",
        [String]    $user = "ops",
        [String]    $newpassword = "changedit",
        [String]    $adminuser = "admin",
        [String]    $adminpassword = "changeit"
    )

    # Write-Host "Test-UserHasPassword with Old Password"
    # $hasOld = Test-EventStoreUserHasPassword $url $user $oldpassword
    # Write-Host "HasOldPasssword $hasOld"
    
    Write-Host "Test-UserHasPassword with New Password"
    $hasNew = Test-EventStoreUserHasPassword $url $user $newpassword
    Write-Host "HasNewPassword $hasNew"
    
    if (-not $hasNew)
    {
        Write-Host "Should Change Password"
    
        Write-Host "Test-SetUserPassword"
        Set-EventStoreUserPassword $url $user $newpassword $adminuser $adminpassword
    
        Write-Host "Test-UserHasPassword with New Password"
        $hasNew = Test-EventStoreUserHasPassword $url $user $newpassword
        Write-Host "HasNewPassword $hasNew"
    }    
    

    if (-not $hasNew){
        throw "Not the right Password"
    }
}

Export-ModuleMember 'Assert-EventStoreUserHasPassword'