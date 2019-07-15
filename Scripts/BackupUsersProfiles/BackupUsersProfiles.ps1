<#
.SYNOPSIS
    Backup user files to remote folder.
.DESCRIPTION
    This script will create a backup of user's profile folder (Usually found in C:\Users)
    The backup is done via robocopy utility. By defalut, it uses 16 threads (/MT:16 switch), but if you're having problems you could adjust /MT switch or remove it altogether.
.NOTES
    Version:            1
    Author:             Alex
    
   .EXAMPLE
    ./BackupUsersProfiles.ps1
#>

$ErrorActionPreference = "Continue"

### Import Assemblies
[Void][Reflection.Assembly]::Load("System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089")

### RegEx String to filter out system folders and files
$RegEx = "(Intel|Program\sFiles|Temp|Users|PerfLogs|Windows)|(^.*\.(bat|sys|log|tmp|bak)$)"
$Date = Get-Date -f dd.MM.yyyy-HH.mm
#$ProfileSelection = Select-TextItem -ErrorAction Ignore -Options (Get-ChildItem -Path "C:\Users" -ErrorAction Ignore) -DisplayProperty Name
$ProfileSelection = Get-ChildItem -Path "C:\Users" -Name
$BackupFolder = $ProfileSelection.Name + $Date
$UserProfile = Get-ChildItem -Path "C:\users"-Recurse $ProfileSelection.FullName
$UserProfileSize = $UserProfile | Measure-Object -Property Length -Sum

New-Item -Path \\Repository\Software\Scripts\BackupUsersProfiles\$env:computername.$Date -ItemType Directory -Force #| Out-Null
New-Item -Path \\Repository\Software\Scripts\BackupUsersProfiles\$env:computername.$Date\$BackupFolder -ItemType Directory -Force

$UserProfilePath = $ProfileSelection.FullName
$UserProfileFolder = $ProfileSelection.Name

Write-Host "`nDébut de la Sauvegarde des profils utilisateurs locaux" -foregroundcolor cyan

Sleep 5

Robocopy $UserProfileFolder "C:\users\" "\\Repository\Software\Scripts\BackupUsersProfiles\$env:computername.$Date\$BackupFolder\" /XJ /MIR /MT:16 /r:0 /A-:SH

Write-Host "`nFin de la Sauvegarde des profils utilisateurs locaux !" -foregroundcolor cyan
