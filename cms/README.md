## Prerequisites
### General
* Visual Studio 2019 running as "Administrator".
* .Net Framework 4.8 ???
* Powershell execution policy set to unrestricted. To do this, run the following PowerShell command as "Administrator":
    - set-executionpolicy unrestricted
### Docker
* Docker Desktop (https://www.docker.com/products/docker-desktop).
* Docker should use Windows containers (https://docs.docker.com/docker-for-windows/#switch-between-windows-and-linux-containers).

## Installing
* Clone the repository to "[PROJECT_FOLDER]\Source" (e.g. C:\Sidoku\Source).
* Install Docker prerequisites using the PowerShell script "[PROJECT_FOLDER]\Source\cms\setup\install-preqrequisites.ps1".
* Run "docker-compose up -d" in the "[PROJECT_FOLDER]\Source\cms" folder to start up the Sitecore environment. (You can stop the containers using docker-compose down).
* Run "npm install" in the "[PROJECT_FOLDER]\Source\cms\src\Website\code" folder.
When everything is running you should be able to access the Sitecore environment on http://localhost:44001.
* When docker is running and Sitecore is accessible:
	- Open Visual Studio.
    - Build the "Website" project.
    - Navigate to your Sitecore instance (https://sidoku.localhost).

## How It Works
* All project, feature and foundation projects are referenced by the "Website" project on build.
* Building the "Website" project will also do the following:
    - Publish your solution output to Sitecore.
	- Add the CM (https://sidoku.localhost) & Identity (https://identity.localhost) host name entries to your hosts file.
    - Run a Unicorn sync (First build only). Reloading the "Website" project will result in the Unicorn sync running on the next build.

## Sitecore Credentials
* Username: admin
* Password: b