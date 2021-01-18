# Clean data folders
Get-ChildItem -Path (Join-Path $PSScriptRoot "\data") -Directory | ForEach-Object {
    $dataPath = $_.FullName

    Get-ChildItem -Path $dataPath -Recurse | Remove-Item -Force -Recurse -Verbose
}

# Clean deploy folders
Get-ChildItem -Path (Join-Path $PSScriptRoot "\deploy") -Directory | ForEach-Object {
    $deployPath = $_.FullName

    Get-ChildItem -Path $deployPath -Recurse | Remove-Item -Force -Recurse -Verbose
}