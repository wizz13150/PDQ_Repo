Powershell command to get Local Printers on a remote computer.
````
Get-WmiObject win32_printer| select Name, Sharename, SystemName
````
