@{
    ModuleVersion     = "0.0.1";
    GUID              = "ee3a4791-4509-4eb2-895f-b159037102c1";
    Author            = "Tobias Boeker";
    CompanyName       = "Softwarepioniere GmbH & Co. KG";
    Copyright         = "(c) 2018 Softwarepioniere GmbH & Co. KG. Alle Rechte vorbehalten.";
    Description       = "PowerShell Module for Managing the EventStore (geteventstore)";
    PowerShellVersion = "3.0";
    CLRVersion        = "4.0";
    FunctionsToExport = @("Assert-EventStoreUserHasPassword"
                        ,"New-EventStoreStartupTask"
                        ,"Set-EventStoreUserPassword"
                        ,"Stop-EventStore"
                        ,"Test-EventStoreRunning"
                        ,"Test-EventStoreStartupTask"
                        ,"Test-EventStoreUserHasPassword")
    RootModule        = "EventStoreUtil.psm1"
    PrivateData = @{
        PSData = @{
            ProjectUri = 'https://github.com/SoftwarePioniere/EventStoreUtilPowerShell'
        }
    }
}

