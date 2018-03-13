function Test-EventStoreUserHasPassword{

    [Cmdletbinding()]
    Param(
        [String]    $url = "http://localhost:2113",
        [String]    $user = "admin",
        [String]    $password = "changeit"
    )

    Write-Verbose ":: Check if User: $user Has Password:$password on URL:$url"

    $secpasswd = ConvertTo-SecureString $password -AsPlainText -Force
    $credential = New-Object System.Management.Automation.PSCredential($user, $secpasswd)
    $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $user,$password)))

    $url = $url + '/users/' + $user
    Write-Verbose ":: Rest URL: $url"

    try {
        Write-Verbose ":: Try Invoke with Credentials $url"
        $response = Invoke-RestMethod  $url -Credential $credential -Method Get -Headers @{Authorization = "Basic $base64AuthInfo" }
        Write-Verbose ":: Response StatusCode: $response.StatusCode"
        Write-Verbose ":: Response: $response"
        Write-Verbose ":: Benutzer $user kann sich mit dem Kennwort anmelden"
        return $true # benutzer kann
    }
    catch {

        Write-Verbose ":: $_"
        if( $_.Exception.Response.StatusCode.Value__ -ne 401 )
        {
                Write-Verbose ":: Not a 401 Status - fehler"
                throw $_.Exception
        }

        if( $_.Exception.Response.StatusCode.Value__ -eq 401 )
        {
                Write-Verbose "::401 Status - Benutzer kann sich nicht mit dem Kennwort anmelden"
                return $false;
        }
    }

}

Export-ModuleMember 'Test-EventStoreUserHasPassword'