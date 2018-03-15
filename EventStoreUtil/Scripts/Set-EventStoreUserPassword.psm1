function Set-EventStoreUserPassword{

    [Cmdletbinding()]
    Param(
        [String]    $url = "http://localhost:2113",
        [System.Management.Automation.PSCredential] $user,
        [System.Management.Automation.PSCredential] $credential
    )

    Write-Verbose ":: Setting the Password for User: ($user.UserName) with Admin User: ($credential.UserName) on URL:$url"

    $url = -join ( $url , '/users/', $user.UserName , '/command/reset-password' )
    Write-Verbose ":: Rest URL: $url"
    
    $JSON = '{"newPassword":"' + $user.GetNetworkCredential().Password + '"}'

    Write-Verbose ":: JSON: $JSON"
    Write-Verbose ":: Invoking RestMethod"
    Invoke-RestMethod $url -Credential $credential -Method Post -Body $JSON -ContentType "application/json"

    Write-Verbose ":: Waiting 2 seconds"
    Start-Sleep -s 2
}

Export-ModuleMember 'Set-EventStoreUserPassword'