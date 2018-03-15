function Test-EventStoreStartupTask()
{
    [OutputType('System.Boolean')]
    [Cmdletbinding()]
    Param(       
        [String] $taskname
    )

    $task= Get-ScheduledTask | Where-Object { $_.TaskName -eq $taskname }
    If ( $task )
    {

        Write-Verbose ":: task with name found"
        return $true;      
    }

    return $false
}
Export-ModuleMember 'Test-EventStoreStartupTask'