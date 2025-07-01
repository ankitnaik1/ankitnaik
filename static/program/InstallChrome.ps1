# Set the execution policy to allow the script to run
Set-ExecutionPolicy RemoteSigned -Scope Process -Force

# Download Chrome Installer
Invoke-WebRequest -Uri "https://dl.google.com/chrome/install/latest/chrome_installer.exe" -OutFile "$env:TEMP\chrome_installer.exe"

# Run the Installer
Start-Process -FilePath "$env:TEMP\chrome_installer.exe" -ArgumentList "/silent /install" -Wait

# Cleanup
Remove-Item "$env:TEMP\chrome_installer.exe"

Write-Host "Chrome installation completed."

