# Create thorium-ore files from stone.png
$thoriumDir = "bobores/graphics/entity/thorium-ore"
New-Item -ItemType Directory -Force -Path $thoriumDir
Copy-Item "C:/Program Files/Steam/steamapps/common/Factorio/data/base/graphics/icons/stone.png" "$thoriumDir/thorium-ore.png"
Copy-Item "C:/Program Files/Steam/steamapps/common/Factorio/data/base/graphics/icons/stone.png" "$thoriumDir/hr-thorium-ore.png"
Copy-Item "C:/Program Files/Steam/steamapps/common/Factorio/data/base/graphics/icons/stone.png" "$thoriumDir/thorium-ore-glow.png"
Copy-Item "C:/Program Files/Steam/steamapps/common/Factorio/data/base/graphics/icons/stone.png" "$thoriumDir/hr-thorium-ore-glow.png"

# Create sulfur files from sulfur.png
$sulfurDir = "bobores/graphics/entity/sulfur"
New-Item -ItemType Directory -Force -Path $sulfurDir
Copy-Item "C:/Program Files/Steam/steamapps/common/Factorio/data/base/graphics/icons/sulfur.png" "$sulfurDir/sulfur.png"
Copy-Item "C:/Program Files/Steam/steamapps/common/Factorio/data/base/graphics/icons/sulfur.png" "$sulfurDir/hr-sulfur.png"
Copy-Item "C:/Program Files/Steam/steamapps/common/Factorio/data/base/graphics/icons/sulfur.png" "$sulfurDir/sulfur-glow.png"
Copy-Item "C:/Program Files/Steam/steamapps/common/Factorio/data/base/graphics/icons/sulfur.png" "$sulfurDir/hr-sulfur-glow.png" 