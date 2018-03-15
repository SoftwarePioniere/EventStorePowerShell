function Stop-EventStore{

  
    [CmdletBinding(SupportsShouldProcess=$true)]
    Param(
        [String]    $url = "http://localhost:2113",
        [System.Management.Automation.PSCredential] $credential
    )
    
    Write-Verbose (":: Shutting Down the Server with User: $adminuser on URL:$url")    
  
    $url = -join ( $url , '/admin/shutdown' )
    Write-Verbose (":: Rest URL: $url")

   # $credential = New-Object System.Management.Automation.PSCredential($adminuser, $adminpassword)
 
    Write-Verbose ":: Invoking RestMethod"
    Invoke-RestMethod $url -Credential $credential -Method Post -ContentType "application/json"

    Write-Verbose ":: Waiting 2 sekunden"
    Start-Sleep -s 2
}

Export-ModuleMember 'Stop-EventStore'