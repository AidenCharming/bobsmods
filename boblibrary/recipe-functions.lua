if not bobmods.lib.recipe then
  bobmods.lib.recipe = {}
end

local function quantity_convertion(amount, old, new)
  if bobmods.lib.item.get_type(old) == "fluid" and bobmods.lib.item.get_type(new) == "item" then
    amount = math.ceil(amount / 10)
  end
  if bobmods.lib.item.get_type(old) == "item" and bobmods.lib.item.get_type(new) == "fluid" then
    amount = amount * 10
  end
  return amount
end

local function get_old_quantity(ingredients, old)
  local amount = 0
  for i, ingredient in pairs(ingredients) do
    local item = bobmods.lib.item.ingredient_simple(ingredient)
    if item then
      if item.name == old then
        amount = item.amount + amount
      end
    else
      log("recipe contains an invalid ingredient")
    end
  end
  return amount
end

local function replace_ingredient(ingredients, old, new, new_type)
  local amount = get_old_quantity(ingredients, old)
  if amount > 0 then
    amount = quantity_convertion(amount, old, new)
    bobmods.lib.item.remove(ingredients, old)
    bobmods.lib.item.add(ingredients, { type = new_type, name = new, amount = amount })
    return true
  end
  return false
end

function bobmods.lib.recipe.replace_ingredient(recipe, old, new)
  if type(recipe) == "string" and type(old) == "string" and type(new) == "string" and data.raw.recipe[recipe] then
    local retval = false
    local new_type = bobmods.lib.item.get_type(new)

    if new_type and data.raw.recipe[recipe].ingredients then
      new_type = new_type == "fluid" and "fluid" or "item"
      if replace_ingredient(data.raw.recipe[recipe].ingredients, old, new, new_type) then
        retval = true
      end
    end

    return retval
  else
    log(debug.traceback())
    bobmods.lib.error.recipe(recipe)
    bobmods.lib.error.item(old)
    bobmods.lib.error.item(new)
    return false
  end
end

function bobmods.lib.recipe.replace_ingredient_in_all(old, new)
  if type(old) == "string" and type(new) == "string" and bobmods.lib.item.get_type(new) then
    for i, recipe in pairs(data.raw.recipe) do
      bobmods.lib.recipe.replace_ingredient(recipe.name, old, new)
    end
  else
    log(debug.traceback())
    bobmods.lib.error.item(old)
    bobmods.lib.error.item(new)
  end
end

function bobmods.lib.recipe.remove_ingredient(recipe, item)
  if type(recipe) == "string" and type(item) == "string" and data.raw.recipe[recipe] then
    if data.raw.recipe[recipe].ingredients then
      bobmods.lib.item.remove(data.raw.recipe[recipe].ingredients, item)
    end
  else
    log(debug.traceback())
    bobmods.lib.error.recipe(recipe)
    bobmods.lib.error.item(item)
  end
end

function bobmods.lib.recipe.clear_ingredients(recipe)
  if type(recipe) == "string" and data.raw.recipe[recipe] then
    if data.raw.recipe[recipe].ingredients then
      data.raw.recipe[recipe].ingredients = {}
    end
  else
    log(debug.traceback())
    bobmods.lib.error.recipe(recipe)
  end
end

function bobmods.lib.recipe.add_new_ingredient(recipe, item_in)
  local item = bobmods.lib.item.ingredient(item_in)
  if
    type(recipe) == "string"
    and data.raw.recipe[recipe]
    and item
    and type(item) == "table"
    and bobmods.lib.item.get_type(item.name)
  then
    if data.raw.recipe[recipe].ingredients then
      bobmods.lib.item.add_new(data.raw.recipe[recipe].ingredients, item)
    end
  else
    if not (type(recipe) == "string" and data.raw.recipe[recipe]) then
      log(debug.traceback())
      bobmods.lib.error.recipe(recipe)
    end
  end
end

function bobmods.lib.recipe.add_ingredient(recipe, item_in)
  local item = bobmods.lib.item.ingredient(item_in)
  if
    type(recipe) == "string"
    and data.raw.recipe[recipe]
    and item
    and type(item) == "table"
    and bobmods.lib.item.get_type(item.name)
  then
    if data.raw.recipe[recipe].ingredients then
      bobmods.lib.item.add(data.raw.recipe[recipe].ingredients, item)
    end
  else
    if not (type(recipe) == "string" and data.raw.recipe[recipe]) then
      log(debug.traceback())
      bobmods.lib.error.recipe(recipe)
    end
  end
end

function bobmods.lib.recipe.add_ingredients(recipe, ingredients)
  if type(recipe) == "string" and data.raw.recipe[recipe] and type(ingredients) == "table" then
    for i, ingredient in pairs(ingredients) do
      bobmods.lib.recipe.add_ingredient(recipe, ingredient)
    end
  else
    log(debug.traceback())
    bobmods.lib.error.recipe(recipe)
  end
end

function bobmods.lib.recipe.set_ingredient(recipe, item_in)
  local item = bobmods.lib.item.ingredient(item_in)
  if
    type(recipe) == "string"
    and data.raw.recipe[recipe]
    and item
    and type(item) == "table"
    and bobmods.lib.item.get_type(item.name)
  then
    if data.raw.recipe[recipe].ingredients then
      bobmods.lib.item.set(data.raw.recipe[recipe].ingredients, item)
    end
  else
    if not (type(recipe) == "string" and data.raw.recipe[recipe]) then
      log(debug.traceback())
      bobmods.lib.error.recipe(recipe)
    end
  end
end

function bobmods.lib.recipe.set_ingredients(recipe, ingredients)
  if type(recipe) == "string" and data.raw.recipe[recipe] and type(ingredients) == "table" then
    bobmods.lib.recipe.clear_ingredients(recipe)
    bobmods.lib.recipe.add_ingredients(recipe, ingredients)
  else
    log(debug.traceback())
    bobmods.lib.error.recipe(recipe)
  end
end

function bobmods.lib.recipe.add_result(recipe, item_in)
  local item = bobmods.lib.item.result(item_in)
  if
    type(recipe) == "string"
    and data.raw.recipe[recipe]
    and item
    and type(item) == "table"
    and bobmods.lib.item.get_type(item.name)
  then
    if data.raw.recipe[recipe].results then
      bobmods.lib.item.add(data.raw.recipe[recipe].results, item)
    end
  else
    if not (type(recipe) == "string" and data.raw.recipe[recipe]) then
      log(debug.traceback())
      bobmods.lib.error.recipe(recipe)
    end
  end
end

function bobmods.lib.recipe.set_result(recipe, item_in)
  local item = bobmods.lib.item.result(item_in)
  if
    type(recipe) == "string"
    and data.raw.recipe[recipe]
    and item
    and type(item) == "table"
    and bobmods.lib.item.get_type(item.name)
  then
    if data.raw.recipe[recipe].results then
      bobmods.lib.item.set(data.raw.recipe[recipe].results, item)
    end
  else
    if not (type(recipe) == "string" and data.raw.recipe[recipe]) then
      log(debug.traceback())
      bobmods.lib.error.recipe(recipe)
    end
  end
end

function bobmods.lib.recipe.remove_result(recipe, item)
  if type(recipe) == "string" and type(item) == "string" and data.raw.recipe[recipe] then
    if data.raw.recipe[recipe].results then
      bobmods.lib.item.remove(data.raw.recipe[recipe].results, item)
    end
  else
    log(debug.traceback())
    bobmods.lib.error.recipe(recipe)
    bobmods.lib.error.item(item)
  end
end

function bobmods.lib.recipe.enabled(recipe, bool)
  if type(recipe) == "string" and type(bool) == "boolean" and data.raw.recipe[recipe] then
    data.raw.recipe[recipe].enabled = bool or false
  else
    log(debug.traceback())
    bobmods.lib.error.recipe(recipe)
    if not (type(bool) == "boolean") then
      log("Variable Bool is missing or not of type Boolean")
    end
  end
end

function bobmods.lib.recipe.hide(recipe)
  if type(recipe) == "string" and data.raw.recipe[recipe] then
    local prototype = data.raw.recipe[recipe]
    prototype.hidden = true
    prototype.enabled = false
  else
    log(debug.traceback())
    bobmods.lib.error.recipe(recipe)
  end
end

function bobmods.lib.recipe.set_energy_required(recipe, time)
  if type(recipe) == "string" and type(time) == "number" and data.raw.recipe[recipe] then
    data.raw.recipe[recipe].energy_required = time
  else
    log(debug.traceback())
    bobmods.lib.error.recipe(recipe)
    if not (type(time) == "number") then
      log("Variable Time is missing or not of type Number")
    end
  end
end

local function duplicate_ingredient_check(recipe_name, ingredients)
  local new_ingredients = {}
  local items = {}
  local rebuild = false
  for i, ingredient in ipairs(ingredients) do
    local item = bobmods.lib.item.ingredient(ingredient)
    if item then -- duplicate value
      if items[item.name] then
        rebuild = true
        log("Duplicate item " .. item.name .. " found on recipe " .. recipe_name .. ".")
      else
        items[item.name] = true
        bobmods.lib.item.add(new_ingredients, ingredient)
      end
    else --invalid value
      rebuild = true
      log("Invalid item found on recipe " .. recipe_name .. ".")
    end
  end
  if rebuild == true then
    return new_ingredients
  end
end

local function duplicate_ingredient_check_full(recipe)
  if type(recipe) == "string" and data.raw.recipe[recipe] then
    if data.raw.recipe[recipe].ingredients then
      local ingredients = duplicate_ingredient_check(recipe, data.raw.recipe[recipe].ingredients)
      if ingredients then
        data.raw.recipe[recipe].ingredients = ingredients
      end
    end
  else
    log(debug.traceback())
    bobmods.lib.error.recipe(recipe)
  end
end

function bobmods.lib.recipe.ingredients_cleanup()
  log("Running recipe ingredients cleanup...")
  for recipe_name, recipe in pairs(data.raw.recipe) do
    duplicate_ingredient_check_full(recipe_name)
  end
end

function bobmods.lib.recipe.set_subgroup(recipe_name, subgroup)
  if type(recipe_name) == "string" and type(subgroup) == "string" then
    local recipe = data.raw.recipe[recipe_name]
    if recipe then
      recipe.subgroup = subgroup
    end
  else
    log(debug.traceback())
    bobmods.lib.error.recipe(recipe_name)
  end
end

function bobmods.lib.recipe.set_category(recipe_name, category)
  if type(recipe_name) == "string" and type(category) == "string" then
    local recipe = data.raw.recipe[recipe_name]
    if recipe then
      recipe.category = category
    end
  else
    log(debug.traceback())
    bobmods.lib.error.recipe(recipe_name)
  end
end

function bobmods.lib.recipe.allow_productivity(recipe_name)
  if type(recipe_name) == "string" then
    local recipe = data.raw.recipe[recipe_name]
    if recipe then
      recipe.allow_productivity = true
    end
  else
    log(debug.traceback())
    bobmods.lib.error.recipe(recipe_name)
  end
end

function bobmods.lib.recipe.disallow_productivity(recipe_name)
  if type(recipe_name) == "string" then
    local recipe = data.raw.recipe[recipe_name]
    if recipe then
      recipe.allow_productivity = false
    end
  else
    log(debug.traceback())
    bobmods.lib.error.recipe(recipe_name)
  end
end

-- Check for Quality mod with proper version
if mods["quality"] and (mods["quality"] >= "2.0.0" or mods["quality"] == "2.0.0") then
  function bobmods.lib.recipe.update_recycling_recipe_icon(recipe, source)
    if type(recipe) == "string" then recipe = data.raw.recipe[recipe] end
    if type(source) == "string" then source = data.raw.item[source] or data.raw.tool[source] end
    
    if recipe and source then
      local icons = bobmods.lib.icons_from_item(source)
      if icons then
        recipe.icons = util.table.deepcopy(icons)
        table.insert(recipe.icons, {
          icon = "__boblibrary__/graphics/icons/recycling.png",
          icon_size = 64,
          scale = 0.25,
          shift = {-8, -8}
        })
      end
    end
  end

  function bobmods.lib.recipe.update_recycling_recipe_single(recipe, source)
    if type(recipe) == "string" then recipe = data.raw.recipe[recipe] end
    if type(source) == "string" then source = data.raw.item[source] or data.raw.tool[source] end
    
    if recipe and source then
      bobmods.lib.recipe.update_recycling_recipe_icon(recipe, source)
      -- Update localized name to indicate recycling
      recipe.localised_name = {"recipe-name.recycling", {"item-name." .. source.name}}
      -- Set allow_decomposition for 2.0 compatibility
      recipe.allow_decomposition = true
    end
  end

  function bobmods.lib.recipe.update_recycling_recipe(recipe, sources)
    if type(recipe) == "string" then recipe = data.raw.recipe[recipe] end
    if not recipe then return end
    
    if #sources > 0 then
      local main_source = sources[1]
      if type(main_source) == "string" then
        main_source = data.raw.item[main_source] or data.raw.tool[main_source]
      end
      
      if main_source then
        bobmods.lib.recipe.update_recycling_recipe_icon(recipe, main_source)
        -- Update localized name for multiple sources
        recipe.localised_name = {"recipe-name.recycling-multiple", {"item-name." .. main_source.name}}
        -- Set allow_decomposition for 2.0 compatibility
        recipe.allow_decomposition = true
      end
    end
  end

  function bobmods.lib.recipe.update_recycling_recipe_self_recipe(recipe)
    if type(recipe) == "string" then recipe = data.raw.recipe[recipe] end
    if not recipe then return end
    
    local result = recipe.result or (recipe.results and recipe.results[1] and recipe.results[1].name)
    if result then
      local source = data.raw.item[result] or data.raw.tool[result]
      if source then
        bobmods.lib.recipe.update_recycling_recipe_single(recipe, source)
      end
    end
  end

  function bobmods.lib.recipe.update_recycling_recipe_from_recipe(target_recipe, source_recipe)
    if type(target_recipe) == "string" then target_recipe = data.raw.recipe[target_recipe] end
    if type(source_recipe) == "string" then source_recipe = data.raw.recipe[source_recipe] end
    if not target_recipe or not source_recipe then return end
    
    local result = source_recipe.result or (source_recipe.results and source_recipe.results[1] and source_recipe.results[1].name)
    if result then
      local source = data.raw.item[result] or data.raw.tool[result]
      if source then
        bobmods.lib.recipe.update_recycling_recipe_single(target_recipe, source)
      end
    end
  end
else
  -- Stubs for when Quality mod is not present or version incompatible
  local function quality_mod_warning()
    log(debug.traceback())
    if not mods["quality"] then
      log("Cannot update recycling without Quality mod.")
    else
      log("Quality mod version " .. mods["quality"] .. " is not compatible. Version 2.0.0 or higher required.")
    end
  end

  function bobmods.lib.recipe.update_recycling_recipe_icon() quality_mod_warning() end
  function bobmods.lib.recipe.update_recycling_recipe_single() quality_mod_warning() end
  function bobmods.lib.recipe.update_recycling_recipe() quality_mod_warning() end
  function bobmods.lib.recipe.update_recycling_recipe_self_recipe() quality_mod_warning() end
  function bobmods.lib.recipe.update_recycling_recipe_from_recipe() quality_mod_warning() end
end
