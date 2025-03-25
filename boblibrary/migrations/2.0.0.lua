-- Migration script for Factorio 2.0
local function migrate_recipes()
  for _, force in pairs(game.forces) do
    local recipes = force.recipes
    local technologies = force.technologies
    
    -- Ensure recipes are properly enabled based on technology research
    if technologies["automation-2"] and technologies["automation-2"].researched then
      if recipes["assembling-machine-2"] then recipes["assembling-machine-2"].enabled = true end
      if recipes["inserter"] then recipes["inserter"].enabled = true end
    end
    
    if technologies["automation-3"] and technologies["automation-3"].researched then
      if recipes["assembling-machine-3"] then recipes["assembling-machine-3"].enabled = true end
    end
    
    -- Migrate any recipes that need productivity module changes
    if recipes["electronic-circuit"] then recipes["electronic-circuit"].enabled = true end
    if recipes["advanced-circuit"] then recipes["advanced-circuit"].enabled = true end
    if recipes["processing-unit"] then recipes["processing-unit"].enabled = true end
  end
end

local function migrate_technologies()
  for _, force in pairs(game.forces) do
    local technologies = force.technologies
    
    -- Reset technology effects if needed
    if technologies["automation"] and technologies["automation"].researched then
      technologies["automation"].reload_effects()
    end
    
    -- Ensure proper technology unlocks
    for _, tech_name in pairs({
      "automation-2",
      "automation-3",
      "logistics-2",
      "logistics-3",
      "steel-processing",
      "oil-processing",
      "plastics",
      "advanced-electronics",
      "advanced-electronics-2"
    }) do
      if technologies[tech_name] and technologies[tech_name].researched then
        technologies[tech_name].reload_effects()
      end
    end
  end
end

-- Run migrations
script.on_configuration_changed(function(data)
  if data.mod_changes and data.mod_changes["boblibrary"] then
    migrate_recipes()
    migrate_technologies()
  end
end) 