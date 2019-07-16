I won't comment that, see bellow :
````
# For a discussion of this setting and its impact, see:
# http://technet.microsoft.com/en-us/magazine/2007.01.cableguy.aspx
# The intent is to optimize TCP performance by setting the
# receive window auto-tuning level to Disabled.




# To disable TCP/IP autotunning, in an elevated CMD shell run:

netsh.exe interface tcp set global autotuninglevel= Disabled



# To see current TCP global settings and to confirm 
# that "Receive Window Auto-Tuning Level" is disabled:

netsh.exe interface tcp show global



# To reset back to the factory default:
#netsh.exe interface tcp set global autotuninglevel= normal
````
