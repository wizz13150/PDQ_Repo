@echo off
rem :: =============================Configuration Autologon==============================================================
rem :: ===================================== %1 = username ; %2 = password  =============================================
rem ::                           Si le compte et le mot de passe sont identiques
rem :: ============================= Exemple : Autologon.cmd urgbox urgbox : ============================================
rem :: 				             si le compte et le mot de passe sont différents
rem :: ============================= Exemple : Autologon.cmd urgbox ITcha : =============================================


reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /t REG_SZ /d 1 /f
rem :: reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoLogonCount /t REG_SZ /d 999 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /t REG_SZ  /d %1 /f  
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultDomainName /t REG_SZ /d ADCHA /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultPassword /t REG_SZ /d %2 /f 
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v ForceAutoLogon /t REG_SZ /d 1 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DisableCAD /t REG_DWORD /d 1 /f
reg.exe delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoLogonCount /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /t REG_SZ /d 1 /f



rem :: ===================================== FIN ========================================================================

rem :: msg * " Reboot automatique de machine pour valider l'autologon "

rem :: shutdown /r /t 5