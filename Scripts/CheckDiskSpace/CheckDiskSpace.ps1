$DriveSize = (Get-WmiObject Win32_LogicalDisk -filter "DriveType=3" |Select-Object -ExpandProperty size)/1GB
$AvailableSpace = (Get-WmiObject Win32_LogicalDisk -filter "DriveType=3" |Select-Object -ExpandProperty FreeSpace)/1GB
$DriveLetter = Get-WmiObject Win32_LogicalDisk -filter "DriveType=3" |Select-Object -ExpandProperty DeviceID

$DriveSizeStripped = "{0:F0}" -f $DriveSize
$AvailableSpaceStripped = "{0:F0}" -f $AvailableSpace
$PercentAvailable = "{0:P0}" -f ($AvailableSpace/$DriveSize)
$percent = ($used)/($disk.size)
$percent = "{0:P0}" -f $percent

Write-Host "Drive Letter: $DriveLetter"
Write-host "Disque de $DriveSizeStripped`GB"
Write-host "Espace disque libre : $AvailableSpaceStripped`GB"
Write-Host "Pourcentage utilisé : $percent"
Write-host "Pourcentage libre   : $PercentAvailable"


if ($PercentAvailable -lt 20) {Write-Host -ForegroundColor Red "Pas assez d'espace disque !"}
else {Write-Host -ForegroundColor Green "Il y a assez d'espace disque, OK !"}