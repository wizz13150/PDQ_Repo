Powershell script to get the Profile's size, for a logged on user, on a remote computer. Show in MB.
-Change user's profile path
````
$Sum = [math]::Round(
  (
    (
      (
        Get-ChildItem -Path "\\FileServer\Users_directory\$env:username" |
        ForEach-Object {
          Write-Host "Analyse du fichier $($_.FullName)" -ForegroundColor Green ;
          Get-ChildItem -Path $_.FullName -Recurse -File -ErrorAction SilentlyContinue } | Measure-Object -Property Length -Sum).Sum)/1MB 
  )
)
write-Host "Taille totale des données contenus dans le dossier utilisateur de $env:username :" -ForegroundColor Cyan
Write-Host "$Sum Mb" -ForegroundColor Cyan
Write-Host "Chemin analysé :" -ForegroundColor Cyan
Write-Host "\\FileServer\Users_directory\$env:username" -ForegroundColor Cyan
````
