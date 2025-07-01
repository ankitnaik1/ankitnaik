# Set the execution policy to allow the script to run
Set-ExecutionPolicy RemoteSigned -Scope Process -Force

# Download Chrome Installer
Invoke-WebRequest -Uri "https://www.7-zip.org/a/7z2409-x64.exe" -OutFile "$env:TEMP\7zip_installer.exe"

# Run the Installer
Start-Process -FilePath "$env:TEMP\7zip_installer.exe" -ArgumentList "/silent /install" -Wait

# Cleanup
Remove-Item "$env:TEMP\chrome_installer.exe"

Write-Host "AnyDesk installation completed."

