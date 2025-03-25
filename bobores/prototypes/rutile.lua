local ore_icons = require("prototypes.ore-icons")

bobmods.ores.rutile = {
  name = "rutile-ore",
  tint = { r = 0.8, g = 0.55, b = 0.7 },
  map_color = { r = 0.8, g = 0.55, b = 0.7 },
  mining_time = 1,
  enabled = false,
  icons = ore_icons.create_ore_icons("rutile-ore"),
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

function bobmods.ores.rutile.create_autoplace()
  data.raw.resource["rutile-ore"].autoplace = bobmods.lib.resource_autoplace.resource_autoplace_settings({
    name = "rutile-ore",
    order = "c",
    base_density = 4,
    has_starting_area_placement = false,
    regular_rq_factor_multiplier = 0.8,
    starting_rq_factor_multiplier = 1.0,
    patch_set_name = "rutile",
    base_spots_per_km2 = 1.0,
    random_spot_size_minimum = 0.5,
    random_spot_size_maximum = 2.0
  })
  bobmods.ores.rutile.enabled = true
end

data:extend({
  {
    type = "item",
    name = "rutile-ore",
    icons = ore_icons.create_ore_icons("rutile-ore"),
    subgroup = "bob-ores",
    order = "b-rutile",
    stack_size = 200,
    pictures = {
      {filename = "__bobores__/graphics/icons/rutile-ore.png", size = 32, mipmap_count = 4}
    }
  },
  {
    type = "resource",
    name = "rutile-ore",
    icons = ore_icons.create_ore_icons("rutile-ore"),
    flags = {"placeable-neutral"},
    order = "b-rutile",
    map_color = {r=0.8, g=0.55, b=0.7},
    mining_time = 1,
    mining_visualisation_tint = {r = 0.8, g = 0.55, b = 0.7},
    resource_patch_search_radius = 1.5,
    minimum_resource_amount = 35,
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 1,
      results = {{type = "item", name = "rutile-ore", amount_min = 1, amount_max = 1}},
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    autoplace = "control-only",
    stage_counts = {2000},
    stages = {
      sheet = {
        filename = "__bobores__/graphics/entity/rutile/rutile.png",
        priority = "extra-high",
        width = 32,
        height = 32,
        frame_count = 1,
        variation_count = 1
      }
    }
  }
})
