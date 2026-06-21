# Set the execution policy to allow the script to run
Set-ExecutionPolicy RemoteSigned -Scope Process -Force

Write-Host "Downloading Adobe Acrobat Reader..." -ForegroundColor Cyan
Invoke-WebRequest -Uri "https://ardownload3.adobe.com/pub/adobe/acrobat/win/AcrobatDC/2600121662/AcroRdrDCx642600121662_MUI.exe" -OutFile "$env:TEMP\AcroRdrDCx64_en_US.exe"

# Run the Installer Silently
# /sAll = Silent mode for all, /msi = pass parameters to MSI, /norestart = suppress reboot
Write-Host "Installing Adobe Acrobat Reader..." -ForegroundColor Cyan
Start-Process -FilePath "$env:TEMP\AcroRdrDCx64_en_US.exe" -ArgumentList "/sAll /msi /norestart" -Wait

# Cleanup
Remove-Item "$env:TEMP\AcroRdrDCx64_en_US.exe" -Force

Write-Host "Adobe Acrobat Reader installation completed!" -ForegroundColor Green
