$ScriptBlock = {    
    Get-ComputerRestorePoint -OutVariable RestorePoints
 
    if(-not($RestorePoints)){
        
        $env:COMPUTERNAME
 
        Enable-ComputerRestore -Drive C: -Verbose
    }
}
 
Invoke-Command -ScriptBlock $ScriptBlock