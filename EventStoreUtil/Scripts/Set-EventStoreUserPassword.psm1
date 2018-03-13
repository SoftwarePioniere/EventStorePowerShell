function Set-EventStoreUserPassword{

    [Cmdletbinding()]
    Param(
        [String]    $url = "http://localhost:2113",
        [String]    $user = "ops",
        [String]    $newpassword = "changedit",
        [String]    $adminuser = "admin",
        [String]    $adminpassword = "changeit"
    )

    Write-Verbose ":: Setting the NewPassword:$newpassword for User: $user with Admin User: $adminuser and AdminPassword:$adminpassword on URL:$url"

    $url = -join ( $url , '/users/', $user , '/command/reset-password' )
    Write-Verbose ":: Rest URL: $url"

    $secpasswd = ConvertTo-SecureString $adminpassword -AsPlainText -Force
    $credential = New-Object System.Management.Automation.PSCredential($adminuser, $secpasswd)
    $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $user,$password)))

    $JSON = '{"newPassword":"' + $newpassword + '"}'

    Write-Verbose ":: JSON: $JSON"
    Write-Verbose ":: Invoking RestMethod"
    Invoke-RestMethod $url -Credential $credential -Method Post -Body $JSON -ContentType "application/json" -Headers @{Authorization = "Basic $base64AuthInfo" }

    Write-Verbose ":: Waiting 2 seconds"
    Start-Sleep -s 2
}

Export-ModuleMember 'Set-EventStoreUserPassword'