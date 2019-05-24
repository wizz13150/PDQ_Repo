$global:admins = Gwmi win32_groupuser #-ComputerName Micka
$global:admins = $global:admins |? {$_.groupcomponent –like '*"Administrateurs"'}
$global:admins | Select-Object -Property GroupComponent,PartComponent | Format-table -AutoSize


