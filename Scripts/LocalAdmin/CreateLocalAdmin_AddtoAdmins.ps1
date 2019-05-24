$username = "AdminLocal"
$encrypted = Get-Content -Path '\\sccm2012\e$\SCCM_Repository\Software\Scripts\LocalAdmin\Required.txt'
$key = (1..16)
$EncryptedPassword = $encrypted | ConvertTo-SecureString -Key $key
$BSTR = `
    [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($EncryptedPassword)
$Password = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR) 

#get list of computers
$servers = $env:COMPUTERNAME

foreach ($s in $servers) {
   $computer = [ADSI]“WinNT://$s”
   Try {
      $users = $computer.psbase.children | select -expand name  
      if ($users -like $username) {
         Write-Host -ForegroundColor Red "L'utilisateur '$username' existe déjà sur le poste $($computer.name), erreurs à suivre !"
         $user_obj.SetPassword($Password)
         Write-Host -ForegroundColor Green "Le mot de passe a été fixé sur celui voulu"
         Write-host -ForegroundColor Green "On s'assure que cet Utilisateur est bien Admin Local, OK !"
         #cmd /c "net localgroup Administrateurs /add "$username""
         cmd.exe /C "net localgroup Administrateurs /add "$username""
      } Else {
         $user_obj = $computer.Create(“user”, “$username”)
         $user_obj.SetPassword($Password)
         $user_obj.SetInfo()
         $user_obj.Put(“description”, “Administrateur Local créé par Alex”)
         $user_obj.SetInfo()
         $user_obj.psbase.invokeset(“AccountDisabled”, “False”)
	     $user_obj.Put("UserFlags", $user_obj.Get("UserFlags") -BOr $UFPwdNeverExpires)
	     $user_obj.Put("UserFlags", $user_obj.Get("UserFlags") -BOr $UFCannotChangePwd)
         $user_obj.SetInfo()
         $users = $computer.psbase.children | select -expand name
         if ($users -like $username) {
            Write-Host -ForegroundColor Green "L'utilisateur '$username' a bien été créé sur le poste $($computer.name) !"
            Write-Host -ForegroundColor Green "On s'assure que cet Utilisateur est bien membre du groupe local 'Administrateurs', OK !"
            cmd.exe /C "net localgroup Administrateurs /add "$username""
         } Else {
            Write-Host -ForegroundColor Red "Oops, l'utilisateur '$username' n'a pas été créé sur le poste $($computer.name)"
         }
      }
   } Catch {
      Write-Host -ForegroundColor Red "Oops, Erreur en créant l'utilisateur '$username' sur le poste $($computer.path):  $($Error[0].Exception.Message)"
   }
}