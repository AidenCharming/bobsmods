local ore_icons = require("prototypes.ore-icons")

bobmods.ores.tin = {
  name = "tin-ore",
  tint = { r = 0.85, g = 0.85, b = 0.85 },
  map_color = { r = 0.85, g = 0.85, b = 0.85 },
  mining_time = 1,
  enabled = false,
  icons = ore_icons.create_ore_icons("tin-ore"),
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

function bobmods.ores.tin.create_autoplace()
  data.raw.resource["tin-ore"].autoplace = bobmods.lib.resource_autoplace.resource_autoplace_settings({
    name = "tin-ore",
    order = "c",
    base_density = 4,
    has_starting_area_placement = false,
    regular_rq_factor_multiplier = 0.8,
    starting_rq_factor_multiplier = 1.0,
    patch_set_name = "tin",
    base_spots_per_km2 = 1.0,
    random_spot_size_minimum = 0.5,
    random_spot_size_maximum = 2.0
  })
  bobmods.ores.tin.enabled = true
end

data:extend({
  {
    type = "item",
    name = "tin-ore",
    icons = ore_icons.create_ore_icons("tin-ore"),
    subgroup = "bob-ores",
    order = "b-tin",
    stack_size = 200,
    pictures = {
      {filename = "__bobores__/graphics/icons/tin-ore.png", size = 32, mipmap_count = 4}
    }
  },
  {
    type = "resource",
    name = "tin-ore",
    icons = ore_icons.create_ore_icons("tin-ore"),
    flags = {"placeable-neutral"},
    order = "b-tin",
    map_color = {r=0.85, g=0.85, b=0.85},
    mining_time = 1,
    mining_visualisation_tint = {r = 0.85, g = 0.85, b = 0.85},
    resource_patch_search_radius = 1.5,
    minimum_resource_amount = 35,
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 1,
      results = {{type = "item", name = "tin-ore", amount_min = 1, amount_max = 1}},
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    autoplace = "control-only",
    stage_counts = {2000},
    stages = {
      sheet = {
        filename = "__bobores__/graphics/entity/tin-ore/tin-ore.png",
        priority = "extra-high",
        width = 32,
        height = 32,
        frame_count = 1,
        variation_count = 1
      }
    }
  }
})
