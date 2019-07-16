Powershell script to check if Restore Points are enable for C: drive. If no, this activates it.
````
$ScriptBlock = {    
    Get-ComputerRestorePoint -OutVariable RestorePoints
 
    if(-not($RestorePoints)){
        
        $env:COMPUTERNAME
 
        Enable-ComputerRestore -Drive C: -Verbose
    }
}
 
Invoke-Command -ScriptBlock $ScriptBlock
````
