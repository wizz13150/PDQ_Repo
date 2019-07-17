A Package to list of all devices that do not have drivers, in Devices Manager, or any problem.
Return Devices Names & Compatible IDs, any return code different than 0.

````
$Device = Get-WmiObject Win32_PNPEntity | Where-Object{$_.ConfigManagerErrorcode -ne 0}

Write-Host "Nom périphérique:    " -NoNewline
Write-Host $Device.Name -ForegroundColor Cyan

Write-Host "Compatible ID:       " -NoNewline
Write-Host $Device.CompatibleID -ForegroundColor Cyan
````
