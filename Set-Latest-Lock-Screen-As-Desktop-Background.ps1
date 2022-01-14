Function Set-WallPaper($ImageFilePath) {
    Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name Wallpaper -value $ImageFilePath
    rundll32.exe user32.dll, UpdatePerUserSystemParameters
    rundll32.exe user32.dll, UpdatePerUserSystemParameters
}

$AssetsDir = "$env:USERPROFILE\appdata\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets";

$Files = Get-ChildItem -Path $AssetsDir

$ImageFiles = $Files | Where-Object Length -GT 400KB | Where-Object {
    $ImageFile = New-Object -ComObject Wia.ImageFile
    $ImageFile.LoadFile($_.FullName)

    # Aspect ratio greator than 4:3
    if ($ImageFile.width / $ImageFile.height -gt 1.2) {
        return $ImageFile
    }
}

$LatestImage = $ImageFiles | Sort-Object LastWriteTime -Descending | Select-Object -First 1

Set-WallPaper -ImageFilePath $LatestImage.FullName
