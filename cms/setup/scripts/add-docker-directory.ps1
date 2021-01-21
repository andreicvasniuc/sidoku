[CmdletBinding()]
Param (
    [Parameter(Mandatory = $true)]
    [string]
    [ValidateNotNullOrEmpty()]
    $RootPath
)

##################################
# Create docker directory
##################################
Write-Host "Create docker directory" -ForegroundColor Green
if (!(Test-Path "$RootPath\docker")) 
{
    Copy-Item -Path .\docker -Recurse -Destination $rootPath
} else {
    Write-Host "$RootPath\docker folder already exists" -ForegroundColor Yellow
}

