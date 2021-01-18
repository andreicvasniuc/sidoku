$rootPath = "$(Get-Item ../../../)\docker"
$dataPath = "$rootPath\data"
$deployPath = "$rootPath\deploy"
$traefikPath = "$rootPath\traefik"

Write-Host "Creating required directories"
New-Item -ItemType directory -Force -Path $rootPath
New-Item -ItemType directory -Force -Path $dataPath
New-Item -ItemType directory -Force -Path "$dataPath\cm"
New-Item -ItemType directory -Force -Path "$dataPath\sql"
New-Item -ItemType directory -Force -Path "$dataPath\solr"
New-Item -ItemType directory -Force -Path $deployPath
New-Item -ItemType directory -Force -Path "$deployPath\website"
New-Item -ItemType directory -Force -Path "$deployPath\xconnect"
New-Item -ItemType directory -Force -Path $traefikPath
New-Item -ItemType directory -Force -Path "$traefikPath\certs"
New-Item -ItemType directory -Force -Path "$traefikPath\config"
New-Item -ItemType directory -Force -Path "$traefikPath\config\dynamic"

Write-Host "Copy directories"
Copy-Item -Path .\docker\build -Recurse -Destination $rootPath

Write-Host "Copy files"
Copy-Item -Path .\docker\clean.ps1 -Destination $rootPath

if ((Get-Command "docker" -errorAction SilentlyContinue) -eq $null)
{
    Write-Error "Docker is not installed, please install Docker"
    exit
}

Write-Host "You can start your development environment by running 'docker-compose up -d' in the '$((Get-Item ../).FullName)' folder"
