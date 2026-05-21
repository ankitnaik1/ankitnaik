# Set the execution policy to allow the script to run
Set-ExecutionPolicy RemoteSigned -Scope Process -Force

# Download Chrome Installer
Invoke-WebRequest -Uri "https://github.com/ip7z/7zip/releases/download/26.01/7z2601-x64.exe" -OutFile "$env:TEMP\7zip_installer.exe"

# Run the Installer
Start-Process -FilePath "$env:TEMP\7zip_installer.exe" -ArgumentList "/S" -Wait

# Cleanup
Remove-Item "$env:TEMP\7zip_installer.exe"

Write-Host "7zip installation completed."
