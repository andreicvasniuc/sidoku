[CmdletBinding()]
Param (
    [Parameter(Mandatory = $true)]
    [string]
    [ValidateNotNullOrEmpty()]
    $HostName
)

$ErrorActionPreference = "Stop";

################################
# Add Windows hosts file entries
################################

Write-Host "Adding Windows hosts file entries..." -ForegroundColor Green

Add-HostsEntry "cd.$($HostName).localhost"
Add-HostsEntry "cm.$($HostName).localhost"
Add-HostsEntry "id.$($HostName).localhost"
