function Set-EventStoreStartupTask()
{
    [Cmdletbinding()]
    Param(
        [String] $arg, 
        [String] $taskname,
        [String] $dir
    )

   
    $ex = "cmd.exe "

    If ( Get-ScheduledTask | Where-Object { $_.TaskName -eq $taskname } )
    {
        Write-Verbose ":: Unregister existing Task"
        Unregister-ScheduledTask $taskname -Confirm:$false

    }

    $trigger = New-ScheduledTaskTrigger -AtStartup -RandomDelay 00:00:30

    Write-Host ":: New-ScheduledTaskAction -Execute $ex -WorkingDirectory $dir -Argument $arg"
    $action =  New-ScheduledTaskAction -Execute $ex -WorkingDirectory $dir -Argument $arg
    $principal = New-ScheduledTaskPrincipal -UserID "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest
    Write-Verbose ":: Register Scheduled Task"
    Register-ScheduledTask -TaskName $taskname -Trigger $trigger -Action $action -Principal $principal -ThrottleLimit 0

    Write-Host "!"

}
Export-ModuleMember 'Set-EventStoreStartupTask'