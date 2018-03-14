function Set-EventStoreStartupTask()
{
    [Cmdletbinding()]
    Param(
        [String] $taskname,
        [String] $dir
    )
   
    $ex = "start.cmd"

    If ( Get-ScheduledTask | Where-Object { $_.TaskName -eq $taskname } )
    {
        Write-Verbose ":: Unregister existing Task"
        Unregister-ScheduledTask $taskname -Confirm:$false
    }

    $trigger = New-ScheduledTaskTrigger -AtStartup -RandomDelay 00:00:30

    Write-Verbose ":: New-ScheduledTaskAction -Execute $ex -WorkingDirectory $dir"
    $action =  New-ScheduledTaskAction -Execute $ex -WorkingDirectory $dir
   
    $principal = New-ScheduledTaskPrincipal -UserID "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest
    Write-Verbose ":: Register Scheduled Task"
    Register-ScheduledTask -TaskName $taskname -Trigger $trigger -Action $action -Principal $principal -ThrottleLimit 0

    Write-Host "!"

}

Export-ModuleMember 'Set-EventStoreStartupTask'