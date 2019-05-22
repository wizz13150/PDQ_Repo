<#
.SYNOPSIS
    Disable OSUpgrade Win10
	
.Exemple
    
.Source
https://docs.microsoft.com/fr-fr/windows/deployment/update/waas-configure-wufb

#>
#Stop-Service wuauserv
$OSDUP = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows'
$OSUpgrade = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate'

New-Item -Path $OSDUP -Name 'WindowsUpdate' 
New-ItemProperty -Path $OSUpgrade -Name DisableOSUpgrade -Type DWORD -Value 1
New-ItemProperty -Path $OSUpgrade -Name AllowOSUpgrade -Type DWORD -Value 0
New-ItemProperty -Path $OSUpgrade -Name ReservationAllowed -Type DWORD -Value 0
New-ItemProperty -Path $OSUpgrade -Name DeferFeatureUpdates -Type DWORD -Value 1
New-ItemProperty -Path $OSUpgrade -Name BranchReadinessLevel -Type DWORD -Value 10
New-ItemProperty -Path $OSUpgrade -Name DeferFeatureUpdatesPeriodInDays -Type DWORD -Value 365
New-ItemProperty -Path $OSUpgrade -Name PauseFeatureUpdates -Type DWORD -Value 1
New-ItemProperty -Path $OSUpgrade -Name ExcludeWUDriversInQualityUpdate -Type DWORD -Value 1
