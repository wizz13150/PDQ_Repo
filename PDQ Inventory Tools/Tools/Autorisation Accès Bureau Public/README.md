A command to set ACL on a Directory for Everyone (or not). You need to translate from French/modify "Tout le Monde". Here we block that. I allow access individually.
````
icacls "C:\Users\Public\Desktop" /grant "Tout le Monde":(f) /T
````
