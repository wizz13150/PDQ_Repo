A Package to uninstalls every version of Flash Player

Removes ALL versions of Adobe Flash Player, by performing the following steps:

 1. Runs the Adobe uninstaller, to remove versions v11.4.402.265 and earlier
 2. Runs the Microsoft WMIC command to remove all other versions:
      wmic product where "name like 'Adobe Flash Player%%'" uninstall /nointeractive
 3. Deletes the Adobe Flash Player Update Service
 4. Deletes the Adobe Flash Player Update scheduled task
 5. By default logs to 'C:\Logs\%COMPUTERNAME%_adobe_flash_player_nuker.log'

Script also available here:
http://www.reddit.com/r/usefulscripts/comments/1v4qus/batch_adobe_flash_removal_purge_all_versions_of/

It should look like :
![alt text](https://github.com/wizz13150/PDQ_Repo/blob/master/Uninstalls/remove_adobe_flash_player/Flash.png)
