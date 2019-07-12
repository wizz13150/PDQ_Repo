A Package to remove every version of Java Runtime

This script will:

 - Remove all versions of the Java Runtime (series 3-8, x64 and x86)
 - Remove JavaFX
 - Remove Java Update Scheduler service and associated registry entries
 - Remove Java Quickstart service and associated registry entries
 - Repair WMI if it is broken (in order to use WMI wildcards to uninstall Java)
 - Leave all Java Development Kit (JDK) installations intact
 - Write log file to C:\Logs\<hostname>_java_runtime_remover.txt

Script is also available here:
http://www.reddit.com/r/usefulscripts/comments/2hzt5c/batch_java_runtime_nuker_purge_all_versions_of/

It should look like this :
![alt text](https://github.com/wizz13150/PDQ_Repo/blob/master/Uninstalls/remove_java_runtime/Java.png)
