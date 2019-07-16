Powershell script to get AD Groups, for the logged on User on a remote computer.

````
#Recuperation Username distant :
$ComputerInfos = Get-WmiObject -Class Win32_ComputerSystem -Computername $(Computer:TARGET)
[String] ${stUserDomain},[String] ${stUserAccount} = $ComputerInfos.Username.split("\")

#On cherche les groupes AD :
$ADUserInfo = Get-ADUser ${stUserAccount} -Properties *
Write-Host "L'utilisateur '${stUserAccount}' est membre des groupes :" -ForegroundColor Cyan
$ADUserInfo.MemberOf
````
