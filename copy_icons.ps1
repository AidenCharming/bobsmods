$ores = @(
    "tin-ore",
    "silver-ore",
    "zinc-ore",
    "tungsten-ore",
    "thorium-ore",
    "rutile-ore",
    "nickel-ore",
    "lead-ore",
    "quartz",
    "sulfur"
)

foreach ($ore in $ores) {
    # Create entity directory
    $entityDir = "bobores/graphics/entity/$ore"
    New-Item -ItemType Directory -Force -Path $entityDir

    # Copy icon to both normal and HR versions
    $iconPath = "bobores/graphics/icons/$ore.png"
    if (Test-Path $iconPath) {
        Copy-Item $iconPath "$entityDir/$ore.png"
        Copy-Item $iconPath "$entityDir/hr-$ore.png"
        
        # Create empty glow files (1x1 transparent PNG)
        Copy-Item $iconPath "$entityDir/$ore-glow.png"
        Copy-Item $iconPath "$entityDir/hr-$ore-glow.png"
    } else {
        Write-Host "Warning: Icon not found for $ore"
    }
} 