A Package to set up an AutoLogon on a remote computer.

In this one, I use package's parameters as variable for "Autologon.cmd".
Indeed, you use "%1" & "%2" and just set the value in package.

````
%1 will be the username
%2 will be the password
````

I use this for generic sessions, 1 package for each.

For exemple for 'Bloc' user. You replace 'Username' & 'Password', it should look like this, :

![alt text](https://github.com/wizz13150/PDQ_Repo/blob/master/Scripts/Autologon/Autologon_example.png)
