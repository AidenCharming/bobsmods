if not bobmods then bobmods = {} end
if not bobmods.lib then bobmods.lib = {} end
if not bobmods.lib.recipe then bobmods.lib.recipe = {} end

-- New productivity module functions for Factorio 2.0
function bobmods.lib.recipe.allow_productivity(recipe_name)
  if data.raw.recipe[recipe_name] then
    if not data.raw.recipe[recipe_name].allow_productivity then
      data.raw.recipe[recipe_name].allow_productivity = true
    end
  else
    log("Warning: Recipe " .. recipe_name .. " does not exist when trying to allow productivity.")
  end
end

function bobmods.lib.recipe.disallow_productivity(recipe_name)
  if data.raw.recipe[recipe_name] then
    if data.raw.recipe[recipe_name].allow_productivity then
      data.raw.recipe[recipe_name].allow_productivity = false
    end
  else
    log("Warning: Recipe " .. recipe_name .. " does not exist when trying to disallow productivity.")
  end
end

-- Helper function to check if a recipe allows productivity modules
function bobmods.lib.recipe.check_productivity(recipe_name)
  if data.raw.recipe[recipe_name] then
    return data.raw.recipe[recipe_name].allow_productivity or false
  end
  return false
end

return bobmods.lib.recipe
