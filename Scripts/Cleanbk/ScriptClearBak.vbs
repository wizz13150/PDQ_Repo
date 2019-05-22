'Script de nettoyage des clés de registre des profils temporaires
'Le script va dans HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList
'ensuite il efface les clés qui se terminent par .BAK
'Script à déclencher par GPO, script de démarrage dans une stratégie Ordinateur

Const ForAppending = 8
Const HKEY_LOCAL_MACHINE = &H80000002

Dim CheminScriptActuel, ScriptFileName, Position, CheminLog

CheminScriptActuel = Left(wscript.scriptfullname,Len(wscript.scriptfullname)-Len(wscript.scriptname)-1)

ScriptFileName = wscript.scriptname
Position = InstrRev(ScriptFileName,".")
if (Position > 0) Then ScriptFileName = Left(ScriptFileName, Position - 1)

CheminLog = CheminScriptActuel & "\" & ScriptFileName & "_Log.txt"
strComputer = "."

'On Error Resume Next
Set objRegistry=GetObject("winmgmts:\\" & strComputer & "\root\default:StdRegProv")
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objTextFile = objFSO.OpenTextFile (CheminLog, ForAppending, True)
objTextFile.WriteLine("-------------------------------")
objTextFile.WriteLine("Debut de la suppression des profils temporaires : " & now)
objTextFile.WriteLine("-------------------------------")

strKeyPath = "SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList"
objRegistry.EnumKey HKEY_LOCAL_MACHINE, strKeyPath, arrSubkeys
For Each objSubkey In arrSubkeys
	If Instr(UCase(objSubkey),".BAK") Then
		'wscript.echo objsubkey
		'wscript.echo strkeypath & "\" & objSubkey
		objTextFile.WriteLine(now & " clé a supprimer détectée : " & strKeyPath & "\" & objSubkey)
		Call DeleteRegEntry(HKEY_LOCAL_MACHINE, strKeyPath & "\" & objSubkey)

	End if
Next

objTextFile.WriteLine("Fin de la suppression des profils temporaires : " & now)
objTextFile.WriteLine("")
objTextFile.Close 'Fermeture du fichier
Set objTextFile = Nothing 

Function DeleteRegEntry(sHive, sEnumPath)
	' Attempt to delete key.  If it fails, start the subkey
	' enumration process.
	lRC = objRegistry.DeleteKey(sHive, sEnumPath)
	'wscript.echo sHive
	'wscript.echo sEnumPath
	' The deletion failed, start deleting subkeys.
	If (lRC <> 0) Then

		' Subkey Enumerator
		On Error Resume Next
		lRC = objRegistry.EnumKey(HKEY_LOCAL_MACHINE, sEnumPath, sNames)
		For Each sKeyName In sNames
			If Err.Number <> 0 Then Exit For
			'wscript.echo sHive, sEnumPath & "\" & sKeyName
			lRC = DeleteRegEntry(sHive, sEnumPath & "\" & sKeyName)
			objTextFile.WriteLine(now & " Suppression de la sous clé : " & sEnumPath & "\" & sKeyName)
		Next

		On Error Goto 0
		' At this point we should have looped through all subkeys, trying
		' to delete the registry key again.
		lRC = objRegistry.DeleteKey(sHive, sEnumPath)

	End If

End Function