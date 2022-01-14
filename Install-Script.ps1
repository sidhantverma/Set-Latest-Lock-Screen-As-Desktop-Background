Clear-Host

$InstallPath = "$env:USERPROFILE\SLLSADB"

New-Item -Path $InstallPath -ItemType Directory -Force

Copy-Item -Path "$PSScriptRoot\Set-Latest-Lock-Screen-As-Desktop-Background.ps1" -Destination $InstallPath -Force

New-Item -Path $InstallPath -Name "Execute-SLLSADB.bat" -ItemType "file" -Value "powershell '$InstallPath\Set-Latest-Lock-Screen-As-Desktop-Background.ps1' -WindowStyle Hidden" -Force

New-Item -Path $InstallPath -Name "Startup-SLLSADB.vbs" -ItemType "file" -Value "CreateObject(`"Wscript.Shell`").Run `"cmd /c $InstallPath\Execute-SLLSADB.bat`", 0, false" -Force

Copy-Item -Path $InstallPath\Startup-SLLSADB.vbs -Destination "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup" -Force
