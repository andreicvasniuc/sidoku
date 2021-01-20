$rootPath = "$(Get-Item ../../../)"

Write-Host "Copy directories"
Copy-Item -Path .\docker -Recurse -Destination $rootPath

if ((Get-Command "docker" -errorAction SilentlyContinue) -eq $null)
{
    Write-Error "Docker is not installed, please install Docker"
    exit
}

Write-Host "You can start your development environment by running 'docker-compose up -d' in the '$((Get-Item ../).FullName)' folder"
