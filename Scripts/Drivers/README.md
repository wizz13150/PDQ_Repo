Check Drivers Problems.xml :

A Package to list of all devices that do not have drivers, in Devices Manager, or any problem on a remote computer.
Return Devices Names & Compatible IDs, any return code different than 0.

````
$Device = Get-WmiObject Win32_PNPEntity | Where-Object{$_.ConfigManagerErrorcode -ne 0}

Write-Host "Nom périphérique:    " -NoNewline
Write-Host $Device.Name -ForegroundColor Cyan

Write-Host "Compatible ID:       " -NoNewline
Write-Host $Device.CompatibleID -ForegroundColor Cyan
````

Add Printer Drivers.xml :

A Package to add a list of printer drivers to a remote computer.
You need to adapt "$DriverBase", "$DriversSourcePath" & "-PrinterEnvironment" if needed.
Example :

````
#Liste des Drivers à déclarer:
$DriverBase = @'
Xerox GPD PS V5.645.5.0
Xerox GPD PS V5.645.5.0
Xerox GPD PCL6 V5.645.5.0
Xerox GPD PCL6 V5.645.5.0
Xerox GPD PCL V5.645.5.0
Xerox GPD PCL V5.645.5.0
Xerox Global Print Driver V4 PS
Xerox Global Print Driver V4 PS
Xerox Global Print Driver V4 PCL6
Xerox Global Print Driver V4 PCL6
Xerox Global Print Driver PS
Xerox Global Print Driver PS
Xerox Global Print Driver PCL6
Xerox Global Print Driver PCL6
Xerox Global Print Driver PCL
Xerox Global Print Driver PCL
'@


#Installation des Imprimantes sur Windows:
$DriversSourcePath = "\\NETWORKSHARE\C$\Drivers\Printers\"
Get-ChildItem -Filter "*.inf" -Path $DriversSourcePath -Recurse | ForEach-Object { PnPutil.exe -i -a $_.FullName }

#Injection des Drivers (x86 and x64) au service Spool:
foreach ($DriverName in $DriverBase) {
    Add-PrinterDriver -Name $DriverName -PrinterEnvironment "Windows NT x86"
    Add-PrinterDriver -Name $DriverName -PrinterEnvironment "Windows x64"
}
````
