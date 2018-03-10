function Test-EventStoreRunning {

    [cmdletbinding()]
    Param(
        [String]    $urlp = "http://localhost:2113"
    )

    Write-Host ":Check if URL:$urlp is available"
    Write-Host "::URL:" $urlp

    $i = 1;
    while ($i -ne 10) {
        Write-Host "::Test Versuch $i"
        try {
            Write-Host "::Try Invoke with Credentials" $url
            $response = Invoke-RestMethod  $url -Method Get
            Write-Host "::Respone" $response
            return $true
        }
        catch {

            Write-Host "::"$_
            #return $false
            Write-Host "::Warte 2 sekunden"
            Start-Sleep -s 2
        }

        $i = $i + 1;
    }

    return $false
}