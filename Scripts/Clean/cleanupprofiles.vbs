'--------------------------------------------------------------------------------------------------------------------------
'(c) 2006-2013 KoXo Developpement
'Script for cleaning local profiles
'
'Delprof2
'from http://helgeklein.com/free-tools/delprof2-user-profile-deletion-tool/
'--------------------------------------------------------------------------------------------------------------------------
On Error Resume Next
Dim objArgs, Path, Delprof, Params
Set objArgs=WScript.Arguments
DelProf="DelProf2.exe"
Params="/i /u"
If Params<>"" Then Params=" " & Params
Path=WScript.ScriptFullName
Path=Replace(Path,WScript.ScriptName,Delprof) & Params
Execute Path
WScript.Quit
'--------------------------------------------------------------------------------------------------------------------------
'///////////
'// Execute
function execute(CommandLine)
 On Error Resume Next
 Dim oShell 
 Set oShell=CreateObject("WScript.Shell")
 err.Number=0 
 oShell.Run CommandLine,1,True
 If err.number<>0 Then
    oShell.Popup "Execution : " & CommandLine & VbCrLf & "Description=" & err.Description & VbCrLf & "Code=" & err.Number,5,"Erreur",64
    End If
end function
'--------------------------------------------------------------------------------------------------------------------------
