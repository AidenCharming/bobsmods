local ore_icons = require("prototypes.ore-icons")

bobmods.gems.gems = {
  ["ruby"] = {
    name = "bob-ruby-ore",
    tint = { r = 1, g = 0, b = 0 },
    map_color = { r = 1, g = 0.2, b = 0.2 },
    mining_time = 2.5,
    enabled = false,
    icons = ore_icons.create_ore_icons("ruby-ore"),
    stage_mult = 125,
    minimum_resource_amount = 20
  },
  ["sapphire"] = {
    name = "bob-sapphire-ore",
    tint = { r = 0.1, g = 0.3, b = 1 },
    map_color = { r = 0.2, g = 0.3, b = 1 },
    mining_time = 2.5,
    enabled = false,
    icons = ore_icons.create_ore_icons("sapphire-ore"),
    stage_mult = 125,
    minimum_resource_amount = 20
  },
  ["emerald"] = {
    name = "bob-emerald-ore",
    tint = { r = 0, g = 1, b = 0 },
    map_color = { r = 0.2, g = 1, b = 0.2 },
    mining_time = 2.5,
    enabled = false,
    icons = ore_icons.create_ore_icons("emerald-ore"),
    stage_mult = 125,
    minimum_resource_amount = 20
  },
  ["amethyst"] = {
    name = "bob-amethyst-ore",
    tint = { r = 1, g = 0, b = 1 },
    map_color = { r = 1, g = 0.2, b = 1 },
    mining_time = 2.5,
    enabled = false,
    icons = ore_icons.create_ore_icons("amethyst-ore"),
    stage_mult = 125,
    minimum_resource_amount = 20
  },
  ["topaz"] = {
    name = "bob-topaz-ore",
    tint = { r = 1, g = 0.8, b = 0 },
    map_color = { r = 1, g = 0.8, b = 0.2 },
    mining_time = 2.5,
    enabled = false,
    icons = ore_icons.create_ore_icons("topaz-ore"),
    stage_mult = 125,
    minimum_resource_amount = 20
  },
  ["diamond"] = {
    name = "bob-diamond-ore",
    tint = { r = 0.9, g = 0.9, b = 0.9 },
    map_color = { r = 0.9, g = 0.9, b = 0.9 },
    mining_time = 3,
    enabled = false,
    icons = ore_icons.create_ore_icons("diamond-ore"),
    stage_mult = 150,
    minimum_resource_amount = 15
  }
}

-- Add item definitions for each gem ore type
data:extend({
  {
    type = "item",
    name = "bob-ruby-ore",
    icons = ore_icons.create_ore_icons("ruby-ore"),
    subgroup = "bob-gems-ore",
    order = "a-1[ruby-ore]",
    stack_size = 200,
    pictures = {
      {filename = "__bobores__/graphics/icons/ruby-ore.png", size = 32, mipmap_count = 4}
    }
  },
  {
    type = "item",
    name = "bob-sapphire-ore",
    icons = ore_icons.create_ore_icons("sapphire-ore"),
    subgroup = "bob-gems-ore",
    order = "a-2[sapphire-ore]",
    stack_size = 200,
    pictures = {
      {filename = "__bobores__/graphics/icons/sapphire-ore.png", size = 32, mipmap_count = 4}
    }
  },
  {
    type = "item",
    name = "bob-emerald-ore",
    icons = ore_icons.create_ore_icons("emerald-ore"),
    subgroup = "bob-gems-ore",
    order = "a-3[emerald-ore]",
    stack_size = 200,
    pictures = {
      {filename = "__bobores__/graphics/icons/emerald-ore.png", size = 32, mipmap_count = 4}
    }
  },
  {
    type = "item",
    name = "bob-amethyst-ore",
    icons = ore_icons.create_ore_icons("amethyst-ore"),
    subgroup = "bob-gems-ore",
    order = "a-4[amethyst-ore]",
    stack_size = 200,
    pictures = {
      {filename = "__bobores__/graphics/icons/amethyst-ore.png", size = 32, mipmap_count = 4}
    }
  },
  {
    type = "item",
    name = "bob-topaz-ore",
    icons = ore_icons.create_ore_icons("topaz-ore"),
    subgroup = "bob-gems-ore",
    order = "a-5[topaz-ore]",
    stack_size = 200,
    pictures = {
      {filename = "__bobores__/graphics/icons/topaz-ore.png", size = 32, mipmap_count = 4}
    }
  },
  {
    type = "item",
    name = "bob-diamond-ore",
    icons = ore_icons.create_ore_icons("diamond-ore"),
    subgroup = "bob-gems-ore",
    order = "a-6[diamond-ore]",
    stack_size = 200,
    pictures = {
      {filename = "__bobores__/graphics/icons/diamond-ore.png", size = 32, mipmap_count = 4}
    }
  }
})

function bobmods.gems.gem_autoplace(name)
  data.raw.resource["bob-" .. name .. "-ore"].autoplace = bobmods.lib.resource_autoplace.resource_autoplace_settings({
    name = "bob-" .. name .. "-ore",
    order = "c",
    base_density = 0.75,
    has_starting_area_placement = false,
    regular_rq_factor_multiplier = 0.8,
    starting_rq_factor_multiplier = 1.0,
    patch_set_name = name,
    base_spots_per_km2 = 0.7,
    random_spot_size_minimum = 0.5,  -- New in 2.0: control minimum patch size
    random_spot_size_maximum = 2.0   -- New in 2.0: control maximum patch size
  })
  bobmods.gems.gems[name].enabled = true
end

function bobmods.gems.create_gem_ore(name)
  if bobmods.gems.gems[name].enabled == false then
    data:extend({
      {
        type = "resource",
        name = bobmods.gems.gems[name].name,
        icons = bobmods.gems.gems[name].icons,
        flags = {"placeable-neutral"},
        order = "b-gems-" .. name,
        map_color = bobmods.gems.gems[name].map_color,
        mining_time = bobmods.gems.gems[name].mining_time,
        mining_visualisation_tint = bobmods.gems.gems[name].tint,
        resource_patch_search_radius = 1.5,
        minimum_resource_amount = bobmods.gems.gems[name].minimum_resource_amount,
        minable =
        {
          mining_particle = "stone-particle",
          mining_time = bobmods.gems.gems[name].mining_time,
          results = {{type = "item", name = "bob-" .. name .. "-ore", amount_min = 1, amount_max = 1}},
        },
        collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
        selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
        autoplace = "control-only",
        stage_counts = {2000},
        stages = {
          sheet = {
            filename = "__bobores__/graphics/entity/gems/" .. name .. "-ore.png",
            priority = "extra-high",
            width = 32,
            height = 32,
            frame_count = 1,
            variation_count = 1
          }
        }
      }
    })
  end
end
