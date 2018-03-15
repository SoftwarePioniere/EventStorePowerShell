Import-Module .\Test-EventStoreUserHasPassword.psm1
Import-Module .\Set-EventStoreUserPassword.psm1

function Assert-EventStoreUserHasPassword {
   
    [Cmdletbinding()]
    Param(
        [String]    $url = "http://localhost:2113",
        [System.Management.Automation.PSCredential] $user,
        [System.Management.Automation.PSCredential] $credential
    )

    # Write-Host "Test-UserHasPassword with Old Password"
    # $hasOld = Test-EventStoreUserHasPassword $url $user $oldpassword
    # Write-Host "HasOldPasssword $hasOld"
    
    Write-Information "Test-UserHasPassword with New Password"
    $hasNew = Test-EventStoreUserHasPassword -url $url -credential $user
    Write-Information "HasNewPassword $hasNew"
    
    if (-not $hasNew)
    {
        Write-Information "Should Change Password"
    
        Write-Information "Test-SetUserPassword"
        Set-EventStoreUserPassword -url $url -user $user -credential $credential
    
        Write-Information "Test-UserHasPassword with New Password"
        $hasNew = Test-EventStoreUserHasPassword -url $url -credential $user
        Write-Information "HasNewPassword $hasNew"
    }    
    

    if (-not $hasNew){
        throw "Not the right Password"
    }
}

Export-ModuleMember 'Assert-EventStoreUserHasPassword'