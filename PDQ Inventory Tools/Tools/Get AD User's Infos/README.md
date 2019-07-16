````
Powershell script to get usefull AD Infos, for the logged on User on a remote computer.
A mixture of English and French lol, sry...

You need "Connect.ps1" & "Disconnect.ps1"
-Change the path to "Connect.ps1"
-Change the path to "Disconnect.ps1"
-Change DC's FDQN
-Translate, if needed
-Run
````
````
##################################################
#
# Check AD user and see if anything seems off
#
# Change the $GroupListAlert if you want it to
# warn you, and the $Domains if you have split
# admin / student domains
# 
##################################################

$Good = "Green"
$Bad = "Red"
$OtherName = "Magenta"
$Iffy = "Yellow"
$GroupListAlert = ("SPECIAL GROUP TO WARN ABOUT - ou=company, ou=.com etc")

# Ask for a login name and try to pull information, loop if we error when trying
Do
{

    $Domain = "DC.contonso" #Read-Host "[a]dmin or [s]tudent (a)"
    #If ($Domain -eq "s")
    #{
    #    $Domain = "DC1.contonso"
    #}
    #Else
    #{
    #    $Domain = "DC2.contonso"
    #}

    $ComputerInfos = Get-WmiObject -Class Win32_ComputerSystem -Computername $(Computer:TARGET)
    [String] ${stUserDomain},[String] ${stUserAccount} = $ComputerInfos.Username.split("\")
    $LoginName = [String] ${stUserAccount}
    #$LoginName =  $env:USERNAME 
    #$LoginName = $LoginName.Trim()
    #$LoginName = $LoginName.Replace(" ", ".") 
    $ADUserInfo = Get-ADUser $LoginName -Properties * -Server $Domain

} While (!$?)
$Response = "y"

# If we do, load the modules
If ($Response -eq "n")
{
\\$Repository\Software\Scripts\CheckADUser\Connect.ps1
}

$Today = Get-Date


# Show basic stuff
#Check le Nom de l'utilisateur :
Write-Host "Nom Utilisateur:       " -NoNewline
Write-Host $ADUserInfo.DisplayName -ForegroundColor Cyan

#_________________________
#Check le nom de login, nom utiliser pour la connexion à l'ordinateur :
Write-Host "Nom de Login:          " -NoNewline
Write-Host $ADUserInfo.SAMAccountName -ForegroundColor Cyan

#_________________________
#Check si l'utilisateur peut changer le mot de passe ou pas :
Write-Host "CannotChangePassword: " $ADUserInfo.CannotChangePassword

#_________________________
#Check la date de création du compte utilisateur :
Write-Host "Créé le:               "  -NoNewline
Write-Host $ADUserInfo.Created -ForegroundColor Cyan

#_________________________
#Check la dernière modicication du compte AD :
Write-Host "Modifié le:           " $ADUserInfo.Modified

#_________________________
#Check si un emplacement physique est indiqué ou pas :
If ($ADUserInfo.Office -eq $null)
{
    $Colour = $Good
Write-Host "Bureau:                -NC-"
}
Else
{
Write-Host "Bureau:               "  -NoNewline
Write-Host $ADUserInfo.Office -ForegroundColor Cyan
}

#_________________________
#Check si une adresse Mail est renseigner ou pas :
If ($ADUserInfo.Mail -eq $null)
{
    $Colour = $Good
Write-Host "Mail:                  -NC-" -ForegroundColor $Bad
}
Else
{
Write-Host "Mail:                  "  -NoNewline
Write-Host $ADUserInfo.Mail -ForegroundColor Cyan
}

#_________________________
#Check si un numéro de téléphone est renseigné ou pas :
If ($ADUserInfo.OfficePhone -eq $null)
{
    $Colour = $Good
Write-Host "Téléphone:             " -NoNewline
Write-Host "-NC-" -ForegroundColor $Bad
}
Else
{
Write-Host "Téléphone:             "  -NoNewline
Write-Host $ADUserInfo.OfficePhone -ForegroundColor Cyan
}

#_________________________
#Check si le poste au sein du CHA est renseigné ou pas :
If ($ADUserInfo.Title)
{
    $Colour = "Blue"
Write-Host "Poste occupé:          " -NoNewline
Write-Host $ADUserInfo.Title -ForegroundColor $Colour
}
Else
{ 
Write-Host "Poste occupé:          " -NoNewline
Write-Host "-NC-"
}

#_________________________
#Check le nombre d'authentification via l'AD :
Write-Host "Long Count:           " $ADUserInfo.logonCount

#_________________________
#Check si l'utilisateur a un chemin de profil :
If ($ADUserInfo.ProfilePath)
{
    $Colour = $Good
Write-Host "Chemin Profil:         " -NoNewline
Write-Host $ADUserInfo.ProfilePath -ForegroundColor $Colour
}
Else
{
    $Colour = $Bad
Write-Host "Chemin Profil:         " -NoNewline
Write-Host "Pas de ProfilePath! Pas bon!" -ForegroundColor $Colour
 }

#_________________________
#Check si l'utilisateur à un autre nom (Nom de jeune fille)
If ($ADUserInfo.OtherName)
{
    $Colour = $OtherName
Write-Host "Autre Nom:             " -NoNewline
Write-Host $ADUserInfo.OtherName -ForegroundColor $Colour
}
Else
{
    $Colour = $Bad
Write-Host "Autre Nom:             -NC-" -NoNewline
Write-Host $ADUserInfo.OtherName -ForegroundColor $Colour
}

#_________________________
# Check if the account is enabled, color response
If ($ADUserInfo.Enabled)
{
    $Colour = $Good
}
Else
{
    $Colour = $Bad
}
Write-Host "Compte Activé ?    :   " -NoNewline
Write-Host $ADUserInfo.Enabled -ForegroundColor $Colour 

#_________________________
# Check if account is locked out and color accordingly
If ($ADUserInfo.LockedOut)
{
    $Colour = $Bad
}
Else
{
    $Colour = $Good
}
Write-Host "Compte verrouillé ?:   " -NoNewline
Write-Host $ADUserInfo.LockedOut -ForegroundColor $Colour

#_________________________
# If the account is expired (also check for null as that is < today)
If ($ADUserInfo.AccountExpirationDate -lt $Today -and $ADUserInfo.AccountExpirationDate -ne $null)
{
    $Colour = $Good
Write-Host "Compte  expire le  :   " -NoNewline
Write-Host $ADUserInfo.AccountExpirationDate -ForegroundColor $Colour
   
}
Else
{
    $Colour = $Bad
Write-Host "Compte  expire le  :   " -NoNewline
Write-Host $ADUserInfo.AccountExpirationDate -ForegroundColor $Colour
}

#_________________________
#Check si le compte expire ou jamais :
If ($ADUserInfo.accountExpires -eq "0")
{
    $Colour = $Good
Write-Host "Compte  expire:        " -NoNewline
Write-Host "False" -ForegroundColor $Colour
}
Else
{
    $Colour = $Bad
Write-Host "Compte  expire:        " -NoNewline
Write-Host "True" -ForegroundColor $Colour

}

#_________________________
# Have they logged in in the last 7 days
If ($ADUserInfo.LastLogonDate.AddDays(7) -lt $Today)
{
    $Colour = $Iffy
}
Else
{
    $Colour = $Good
}
Write-Host "Dernier Logon:         " -NoNewline
Write-Host $ADUserInfo.LastLogonDate -ForegroundColor $Colour

#_________________________
# Check PasswordLastSet isn't null (to prevent errors)
If ($ADUserInfo.PasswordLastSet -eq $Null)
{
    $Colour = $Iffy
    Write-Host "MDP paramétré le:       " -NoNewline
    Write-Host "NULL" -ForegroundColor $Colour
}
Else
{
    # If they set their password over 90 days ago, OR in the last day
    If ($ADUserInfo.PasswordLastSet.AddDays(90) -lt $Today -or $ADUserInfo.PasswordLastSet.AddDays(1) -gt $Today)
    {
        $Colour = $Iffy
    }
    Else
    {
        $Colour = $Good
    }
    Write-Host "MDP paramétré le:      " -NoNewline
    Write-Host $ADUserInfo.PasswordLastSet -ForegroundColor $Colour

    # Is their password expired (based on GPO of 90 days)
    If ($ADUserInfo.PasswordLastSet.AddDays(90) -lt $Today)
    {
        $Colour = $Bad
    }
    Else
    {
        $Colour = $Good
    }
    Write-Host "MDP expire le:         " -NoNewline
    Write-Host $ADUserInfo.PasswordLastSet.AddDays(90) -ForegroundColor $Colour
}

#_________________________
# Ckeck si le mot de passe n'expire jamais ou pas :
If ($ADUserInfo.PasswordNeverExpires)
{
    $Colour = $Good
}
Else
{
    $Colour = $Bad
}
Write-Host "MDP n'expire jamais?:  " -NoNewline
Write-Host $ADUserInfo.PasswordNeverExpires -ForegroundColor $Colour
Write-Host "User dans l'OU:        " -NoNewline
Write-Host $ADUserInfo.CanonicalName -ForegroundColor Cyan
Write-Host "Membre des Groupes:         "

# Check the groups they are in
ForEach ($GroupList in $ADUserInfo.MemberOf)
{
    # If it is Deny Logins, colour it!
    If ($GroupListAlert -contains $GroupList)
    {
        Write-Host "                  " $GroupList -ForegroundColor $Bad
    }
    Else
    {
        Write-Host "                  " $GroupList
    }
}


    $MSUser.Licenses.ServiceStatus | FT -AutoSize

    # And tidy up and close the session down
    \\$Repository\Software\Scripts\CheckADUser\Disconnect.ps1
    ````
