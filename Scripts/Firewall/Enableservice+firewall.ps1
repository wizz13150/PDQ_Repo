Set-Service -Name Mpssvc -StartupType Automatic
start-service -name MpsSvc
netsh advfirewall set allprofiles state off
# netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes
