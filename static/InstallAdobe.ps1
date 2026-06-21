# Set the execution policy to allow the script to run
Set-ExecutionPolicy RemoteSigned -Scope Process -Force

Write-Host "Downloading Adobe Acrobat Reader..." -ForegroundColor Cyan
Invoke-WebRequest -Uri "https://get.adobe.com/reader/download?os=Windows+11&name=Reader+2026.001.21662+MUI+for+Windows-64bit&lang=mui&nativeOs=Linux+x86_64&accepted=&declined=&preInstalled=&site=enterprise" -OutFile "$env:TEMP\AcroRdrDCx64_en_US.exe"

# Run the Installer Silently
# /sAll = Silent mode for all, /msi = pass parameters to MSI, /norestart = suppress reboot
Write-Host "Installing Adobe Acrobat Reader..." -ForegroundColor Cyan
Start-Process -FilePath "$env:TEMP\AcroRdrDCx64_en_US.exe" -ArgumentList "/sAll /msi /norestart" -Wait

# Cleanup
Remove-Item "$env:TEMP\AcroRdrDCx64_en_US.exe" -Force

Write-Host "Adobe Acrobat Reader installation completed!" -ForegroundColor Green
