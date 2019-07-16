Powershell script to Open an user's profile (logged on a remote computer). It works for a local, or an itinerant profile. Don't forget this one too, usefull for me.
````
#Get Remote Username :
$ComputerInfos = Get-WmiObject -Class Win32_ComputerSystem -Computername $(Computer:TARGET)
[String] ${stUserDomain},[String] ${stUserAccount} = $ComputerInfos.Username.split("\")

#On ouvre l'explorateur sur le dossier utilisateur ciblé
cmd.exe /c explorer.exe \\FileServer\users_directory\${stUserAccount}
````
