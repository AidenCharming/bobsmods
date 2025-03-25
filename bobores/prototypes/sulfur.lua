local ore_icons = require("prototypes.ore-icons")

bobmods.ores.sulfur = {
  name = "sulfur",
  tint = { r = 0.8, g = 0.8, b = 0.0 },
  map_color = { r = 0.8, g = 0.8, b = 0.0 },
  mining_time = 1,
  enabled = false,
  icons = ore_icons.create_ore_icons("sulfur"),
  stage_mult = 100,
  item = {
    create = true,
    create_variations = true,
    subgroup = "bob-ores",
  },
  sprite = {
    sheet = 1,
  },
  autoplace = "control-only",
  planets = { "nauvis" },
  minimum_resource_amount = 35
}

function bobmods.ores.sulfur.create_autoplace()
  data.raw.resource["sulfur"].autoplace = bobmods.lib.resource_autoplace.resource_autoplace_settings({
    name = "sulfur",
    order = "c",
    base_density = 4,
    has_starting_area_placement = false,
    regular_rq_factor_multiplier = 0.8,
    starting_rq_factor_multiplier = 1.0,
    patch_set_name = "sulfur",
    base_spots_per_km2 = 1.0,
    random_spot_size_minimum = 0.5,
    random_spot_size_maximum = 2.0
  })
  bobmods.ores.sulfur.enabled = true
end

data:extend({
  {
    type = "item",
    name = "sulfur",
    icons = {
      {
        icon = "__base__/graphics/icons/sulfur.png",
        icon_size = 64,
        icon_mipmaps = 4,
        tint = {r = 0.8, g = 0.8, b = 0.0}
      }
    },
    subgroup = "bob-ores",
    order = "b-sulfur",
    stack_size = 200,
    pictures = {
      {
        filename = "__base__/graphics/icons/sulfur.png",
        size = 64,
        scale = 0.5,
        mipmap_count = 4,
        tint = {r = 0.8, g = 0.8, b = 0.0}
      }
    }
  },
  {
    type = "resource",
    name = "sulfur",
    icons = ore_icons.create_ore_icons("sulfur"),
    flags = {"placeable-neutral"},
    order = "b-sulfur",
    map_color = {r=0.8, g=0.8, b=0.0},
    mining_time = 1,
    mining_visualisation_tint = {r = 0.8, g = 0.8, b = 0.0},
    resource_patch_search_radius = 1.5,
    minimum_resource_amount = 35,
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 1,
      results = {{type = "item", name = "sulfur", amount_min = 1, amount_max = 1}},
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    autoplace = bobmods.lib.resource_autoplace.resource_autoplace_settings({
      name = "sulfur",
      order = "c",
      base_density = 4,
      has_starting_area_placement = false,
      regular_rq_factor_multiplier = 0.8,
      starting_rq_factor_multiplier = 1.0,
      patch_set_name = "sulfur",
      base_spots_per_km2 = 1.0,
      random_spot_size_minimum = 0.5,
      random_spot_size_maximum = 2.0
    }),
    stage_counts = {2000},
    stages = {
      sheet = {
        filename = "__bobores__/graphics/entity/sulfur/sulfur.png",
        priority = "extra-high",
        width = 32,
        height = 32,
        frame_count = 1,
        variation_count = 1
      }
    }
  }
})
