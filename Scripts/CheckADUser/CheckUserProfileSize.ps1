# Get the cumulative size of all user profiles on the system in GB

$Sum = [math]::Round(
  (
    (
      (
        Get-ChildItem -Path "\\home.adcha.local\USERS$\$env:username" |
        ForEach-Object {
          Write-Host "Analyse du fichier $($_.FullName)" -ForegroundColor Green ;
          Get-ChildItem -Path $_.FullName -Recurse -File -ErrorAction SilentlyContinue } | Measure-Object -Property Length -Sum).Sum)/1MB 
  )
)
write-Host "Taille totale des données contenus dans le dossier utilisateur de $env:username :" -ForegroundColor Cyan
Write-Host "$Sum Mb" -ForegroundColor Cyan
Write-Host "Chemin analysé :" -ForegroundColor Cyan
Write-Host "\\home.adcha.local\USERS$\$env:username" -ForegroundColor Cyan