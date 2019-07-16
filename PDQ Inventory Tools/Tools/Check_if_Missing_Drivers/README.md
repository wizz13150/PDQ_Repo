Powershell command to check if drivers are missing (or any error code) on a remote computer, and list them.
````
Get-WmiObject Win32_PNPEntity | Where-Object{$_.ConfigManagerErrorCode -ne 0} | Select Name, DeviceID
````
