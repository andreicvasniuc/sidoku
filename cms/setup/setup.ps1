[CmdletBinding()]
Param (
    [Parameter(Mandatory = $true)]
    [string]
    [ValidateNotNullOrEmpty()]
    $LicenseXmlPath,

    [string]
    $HostName = "sidoku"
)

$RootPath = "$(Get-Item ../../../)"

& "./scripts/install-modules.ps1"
& "./scripts/add-docker-directory.ps1" -RootPath $RootPath
& "./scripts/configure-certificates.ps1" -RootPath $RootPath -HostName $HostName
& "./scripts/add-env-file.ps1" -LicenseXmlPath $LicenseXmlPath -HostName $HostName
& "./scripts/populate-hosts-file.ps1" -HostName $HostName

if ((Get-Command "docker" -errorAction SilentlyContinue) -eq $null)
{
    Write-Error "Docker is not installed, please install Docker"
    exit
}

Write-Host "You can start your development environment by running 'docker-compose up -d' in the '$((Get-Item ../).FullName)' folder"