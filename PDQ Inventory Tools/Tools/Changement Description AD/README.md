Powershell script to replace an AD Description for a remote computer, and then Scan for AD Infos. Usefull one !
````
$description = Read-Host 'Entrez la description voulue ' 
Set-ADComputer $(Computer:TARGET) -replace:@{"description"="$($description)"}
Invoke-Command -ScriptBlock {pdqinventory ScanComputers -Computers "$(Computer:TARGET)" -ScanProfile "AD Infos"}
````
