function Test-EventStoreStartupTask()
{
    [Cmdletbinding()]
    Param(
        [String] $arg, 
        [String] $taskname
    )

    $task= Get-ScheduledTask | Where-Object { $_.TaskName -eq $taskname }
    If ( $task )
    {
        Write-Verbose ":: task with name found"
        $task | Out-String

        $action = $task.Actions[0]

        if ( $action )
        {
            Write-Verbose ":: action found"
            $action | Out-String

            $actionarg =  $action.Arguments | Out-String
            Write-Verbose ":: action arguments: $actionarg"
            Write-Verbose ":: args: $arg"
            if ( $actionarg.ToLowerInvariant().Trim() -eq $arg.ToLowerInvariant().Trim())
            {
                return $true;
            }
        }
    }

    return $false
}
Export-ModuleMember 'Test-EventStoreStartupTask'