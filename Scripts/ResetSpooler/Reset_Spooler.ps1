Set-Service -Name Spooler -StartupType Automatic
#Stop-Service -name LPDSVC
Stop-Service -name Spooler
Start-service -name Spooler
#Start-Service -name LPDSVC