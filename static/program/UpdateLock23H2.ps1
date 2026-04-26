# Define the registry path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows"

# Check if the WindowsUpdate key exists, create if not
$windowsUpdateKey = "$registryPath\WindowsUpdate"
if (-not (Test-Path $windowsUpdateKey)) {
    New-Item -Path $windowsUpdateKey -Force
}

# Set the registry values
Set-ItemProperty -Path $windowsUpdateKey -Name "TargetReleaseVersion" -Value 1 -Type DWord -Force
Set-ItemProperty -Path $windowsUpdateKey -Name "TargetReleaseVersionInfo" -Value "23H2" -Type String -Force
Set-ItemProperty -Path $windowsUpdateKey -Name "ProductVersion" -Value "Windows 11" -Type String -Force

Write-Host "Registry keys and values successfully created."
