Clear-Host

$InstallPath = "$env:USERPROFILE\SLLSADB"

# Create install directory
New-Item -Path $InstallPath -ItemType Directory -Force

# Copy main script to install directory
Copy-Item -Path "$PSScriptRoot\Set-Latest-Lock-Screen-As-Desktop-Background.ps1" -Destination $InstallPath -Force

# Create windows batch file script to execute main script
New-Item -Path $InstallPath -Name "Execute-SLLSADB.bat" -ItemType "file" -Value "powershell '$InstallPath\Set-Latest-Lock-Screen-As-Desktop-Background.ps1' -WindowStyle Hidden" -Force

# Create VBS script in Win Startup folder to execute batch file in no window mode
New-Item -Path "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup" -Name "Startup-SLLSADB.vbs" -ItemType "file" -Value "CreateObject(`"Wscript.Shell`").Run `"cmd /c $InstallPath\Execute-SLLSADB.bat`", 0, false" -Force

