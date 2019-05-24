$key = (1..16) 
#Demande le mot de passe du compte à utiliser, encrypte, et stocke dans un fichier texte pour utilisation ensuite
$securepass = Read-Host -AsSecureString -Prompt "Veuillez entrer le mot de passe du compte a utiliser" | ConvertFrom-SecureString -Key $Key 
#Chemin du fichier
$encrypted = $securepass | Out-File -FilePath '\\PDQ_Repository\Scripts\LocalAdmin\Required.txt' 