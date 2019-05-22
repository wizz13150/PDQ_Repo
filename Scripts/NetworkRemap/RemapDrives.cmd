@echo off

rem : Change paths

net use I: \\fileserver\admin$     /persistent:yes
net use J: \\fileserver\appli$     /persistent:yes
net use K: \\fileserver\this$      /persistent:yes
net use L: \\fileserver\that$      /persistent:yes
net use Q: "\\filerserver.adcha.local\users$\%username%\Firefox\%computername%" /persistent:yes 
net use Z: /Delete