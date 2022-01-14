Clear-Host

$InstallPath = "$env:USERPROFILE\SLLSADB"

# Remove install directory
Remove-Item -Path $InstallPath -Force -Recurse

# Remove Startup VBS script
Remove-Item -Path "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\Startup-SLLSADB.vbs" -Force

