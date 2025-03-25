# Get all directories in the entity folder
$entityDirs = Get-ChildItem -Path "bobores/graphics/entity" -Directory

foreach ($dir in $entityDirs) {
    # Find and remove any HR files
    Get-ChildItem -Path $dir.FullName -Filter "hr-*.png" | ForEach-Object {
        Write-Host "Removing HR file: $($_.FullName)"
        Remove-Item $_.FullName
    }
} 