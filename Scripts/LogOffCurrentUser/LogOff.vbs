' Logoff current user on any WMI enabled computer on the network 
 
' Check command line parameters 
 
Select Case WScript.Arguments.Count 
    Case 0 
        ' Default is local computer if none specified 
        strComputer = "." 
    Case 1 
        Select Case WScript.Arguments(0) 
            ' "?", "-?" or "/?" invoke online help 
            Case "?" 
                Syntax 
            Case "-?" 
                Syntax 
            Case "/?" 
                Syntax 
            Case Else 
                strComputer = WScript.Arguments(0) 
        End Select 
    Case Else 
        ' More than 1 argument is not allowed 
        Syntax 
End Select 
 
' Define some constants that can be used in this script; 
' logoff = 0 (no forced close of applications) or 5 (forced); 
' 5 works OK in Windows 2000, but may result in power off in XP 
Const EWX_LOGOFF   = 0 
Const EWX_SHUTDOWN = 1 
Const EWX_REBOOT   = 2 
Const EWX_FORCE    = 4 
Const EWX_POWEROFF = 8 
 
' Connect to computer 
Set OpSysSet = GetObject("winmgmts:{(Shutdown)}//" & strComputer & "/root/cimv2").ExecQuery _ 
    ("select * from Win32_OperatingSystem where Primary=true") 
 
' Actual logoff 
for each OpSys in OpSysSet 
    OpSys.Win32Shutdown EWX_LOGOFF 
next 
 
' Done 
WScript.Quit(0) 
 
 
Sub Syntax 
msg = vbCrLf & "Logoff.vbs,  Version 1.00" & vbCrLf & _ 
      "Logoff the current user of any WMI enabled computer on the network." & _ 
      vbCrLf & vbCrLf & "Usage:  CSCRIPT  LOGOFF.VBS  [ computer_name ]" & _ 
      vbCrLf & vbCrLf & _ 
      "Where:  " & Chr(34) & "computer_name" & Chr(34) & _ 
      "  is the name of the computer to be logged off" & vbCrLf & _ 
      "                         (without leading backslashes); default is " & _ 
      Chr(34) & "." & Chr(34) & vbCrLf & _ 
      "                         (the local computer)." & vbCrLf & vbCrLf & _ 
      "Written by Rob van der Woude" & vbCrLf & _ 
      "http://www.robvanderwoude.com" & vbCrLf & vbCrLf & _ 
      "Based on posts by Alex Angelopoulos on www.developersdex.com" & _ 
      vbCrLf & _ 
      "and Michael Harris on microsoft.public.scripting.vbscript" & vbCrLf 
Wscript.Echo(msg) 
Wscript.Quit(1) 
End Sub 