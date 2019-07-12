A Package to remove every version of VNC


Original script by Gregory Strike:
   http://www.gregorystrike.com/2012/02/29/script-to-uninstallremove-vnc-passively/

Modified by vocatus for use in PDQ.

This script will:

 - Remove TightVNC, UltraVNC and RealVNC viewers and servers
 - Clean up program files and registry entries left over
 - Remove all VNC services 
 - Write a log file to C:\Logs\<computername>_remove_all_vnc_servers.log *

* Configurable. Change the LOGPATH and LOGFILE variables in the script if you want to log to a different location

It should look like this :

![alt text](https://github.com/wizz13150/PDQ_Repo/blob/master/Uninstalls/remove_vnc_servers/VNC.png)
