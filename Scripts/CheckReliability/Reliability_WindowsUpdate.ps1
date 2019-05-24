Function Get-ReliabilityInfo{ 
<#  
 .SYNOPSIS  
    List events from the reliability records 
 .DESCRIPTION  
    This is helpful for troubleshooting application hangs, errors, failed Windows Updates, and much more.  You can also determine which Windows Updates have been installed recently. 
 .NOTES  
    Author  : Rich Prescott  
    Requires: PowerShell Version 1.0  
 .LINK  
    http://blog.richprescott.com 
    http://twitter.com/Rich_Prescott 
 .EXAMPLE 
    Get-ReliabilityInfo 
     
    Lists application errors from the local computer 
 .EXAMPLE 
    Get-ReliabilityInfo -Computername MyPC01 -Type Microsoft-Windows-WindowsUpdateClient 
     
    Shows recently installed updates and their installation results 
 .Parameter Type 
    Available Options: 
        MsiInstaller 
        Microsoft-Windows-WindowsUpdateClient 
        Microsoft-Windows-UserPnp 
        Application Error 
        Application Hang 
        EventLog 
#>  
 
    Param( 
    [String[]]$Computername=$Env:Computername, 
    [String]$Type='Microsoft-Windows-WindowsUpdateClient' 
    ) 
 
Process{ 
    ForEach ($Computer in $ComputerName){ 
        Get-WmiObject Win32_ReliabilityRecords -ComputerName $Computer | 
        Where-Object{$_.SourceName -eq $Type} | 
        Sort-Object TimeGenerated | 
        Select-Object SourceName,Logfile,TimeGenerated,EventIdentifier,Message 
        } 
    } 
}
Get-ReliabilityInfo