function Test-EventStoreRunning {

    [OutputType('System.Boolean')]
    [cmdletbinding()]
    Param(
        [String]    $url = "http://localhost:2113" ,
        [Int]       $repeats = 3,
        [Int]       $secondsToWait = 1
    )
    
    Write-Information ":: Testing EventStore on URL: $url"

    $i = 1;
    while ($i -ne $repeats) {
        Write-Verbose -Message (":: Attemp: $i")
        try {
            Write-Verbose -Message (":: Try to Invoke Invoke-RestMethod: $url")
            $response = Invoke-RestMethod  $url -Method Get
            Write-Verbose -Message (":: Response: $response")

            return $true
        }
        catch {

            Write-Verbose -Message (":: $_")
            #return $false
            Write-Verbose -Message (":: Waiting $secondsToWait seconds")
            Start-Sleep -s $secondsToWait
        }

        $i = $i + 1;
    }

    return $false
}

Export-ModuleMember 'Test-EventStoreRunning'