A PAckage to check if there is drivers, in Devices Manager, with any problem.

````
$Device = Get-WmiObject Win32_PNPEntity | Where-Object{$_.ConfigManagerErrorcode -ne 0}

Write-Host "Nom périphérique:    " -NoNewline
Write-Host $Device.Name -ForegroundColor Cyan

Write-Host "Compatible ID:       " -NoNewline
Write-Host $Device.CompatibleID -ForegroundColor Cyan
````
