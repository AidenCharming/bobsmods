# List of all ores
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
    "sulfur",
    "ruby-ore",
    "sapphire-ore",
    "emerald-ore",
    "amethyst-ore",
    "topaz-ore",
    "diamond-ore"
)

foreach ($ore in $ores) {
    # Create entity directory
    $entityDir = "bobores/graphics/entity/$ore"
    New-Item -ItemType Directory -Force -Path $entityDir

    # Use iron-ore as base for thorium-ore
    if ($ore -eq "thorium-ore") {
        $sourcePath = "bobores/graphics/icons/iron-ore.png"
    }
    # Use coal as base for sulfur
    elseif ($ore -eq "sulfur") {
        $sourcePath = "bobores/graphics/icons/coal.png"
    }
    # For all other ores, use their own icon
    else {
        $sourcePath = "bobores/graphics/icons/$ore.png"
    }

    # Copy icon to entity directory
    if (Test-Path $sourcePath) {
        Copy-Item $sourcePath "$entityDir/$ore.png" -Force
        # Create empty glow file by copying the same texture
        Copy-Item $sourcePath "$entityDir/$ore-glow.png" -Force
    } else {
        Write-Host "Warning: Icon not found for $ore"
    }
} 