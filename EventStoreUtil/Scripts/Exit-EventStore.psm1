function Exit-EventStore{

    [Cmdletbinding()]
    Param(
        [String]    $url = "http://localhost:2113",
        [String]    $adminuser = "admin",
        [String]    $adminpassword = "changeit"
    )

    Write-Verbose (":: Shutting Down the Server with User: $adminuser on URL:$url")

    $url = -join ( $url , '/admin/shutdown' )
    Write-Verbose (":: Rest URL: $url")

    $secpasswd = ConvertTo-SecureString $adminpassword -AsPlainText -Force
    $credential = New-Object System.Management.Automation.PSCredential($adminuser, $secpasswd)

    $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $adminuser,$adminpassword)))
    
    Write-Verbose ":: Invoking RestMethod"
    Invoke-RestMethod $url -Credential $credential -Method Post -ContentType "application/json" -Headers @{Authorization = "Basic $base64AuthInfo" }

    Write-Verbose ":: Waiting 2 sekunden"
    Start-Sleep -s 2
}

Export-ModuleMember 'Exit-EventStore'