local ore_icons = require("prototypes.ore-icons")

bobmods.ores.tungsten = {
  name = "tungsten-ore",
  tint = { r = 0.3, g = 0.3, b = 0.3 },
  map_color = { r = 0.3, g = 0.3, b = 0.3 },
  mining_time = 2,
  enabled = false,
  icons = ore_icons.create_ore_icons("tungsten-ore"),
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
  minimum_resource_amount = 30
}

function bobmods.ores.tungsten.create_autoplace()
  data.raw.resource["tungsten-ore"].autoplace = bobmods.lib.resource_autoplace.resource_autoplace_settings({
    name = "tungsten-ore",
    order = "c",
    base_density = 3,
    has_starting_area_placement = false,
    regular_rq_factor_multiplier = 0.7,
    starting_rq_factor_multiplier = 1.0,
    patch_set_name = "tungsten",
    base_spots_per_km2 = 0.8,
    random_spot_size_minimum = 0.5,
    random_spot_size_maximum = 2.0
  })
  bobmods.ores.tungsten.enabled = true
end

data:extend({
  {
    type = "item",
    name = "tungsten-ore",
    icons = ore_icons.create_ore_icons("tungsten-ore"),
    subgroup = "bob-ores",
    order = "b-tungsten",
    stack_size = 200,
    pictures = {
      {filename = "__bobores__/graphics/icons/tungsten-ore.png", size = 32, mipmap_count = 4}
    }
  },
  {
    type = "resource",
    name = "tungsten-ore",
    icons = ore_icons.create_ore_icons("tungsten-ore"),
    flags = {"placeable-neutral"},
    order = "b-tungsten",
    map_color = {r=0.3, g=0.3, b=0.3},
    mining_time = 2,
    mining_visualisation_tint = {r = 0.3, g = 0.3, b = 0.3},
    resource_patch_search_radius = 1.5,
    minimum_resource_amount = 30,
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 2,
      results = {{type = "item", name = "tungsten-ore", amount_min = 1, amount_max = 1}},
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    autoplace = bobmods.lib.resource_autoplace.resource_autoplace_settings({
      name = "tungsten-ore",
      order = "c",
      base_density = 3,
      has_starting_area_placement = false,
      regular_rq_factor_multiplier = 0.7,
      starting_rq_factor_multiplier = 1.0,
      patch_set_name = "tungsten",
      base_spots_per_km2 = 0.8,
      random_spot_size_minimum = 0.5,
      random_spot_size_maximum = 2.0
    }),
    stage_counts = {2000},
    stages = {
      sheet = {
        filename = "__bobores__/graphics/entity/tungsten-ore/tungsten-ore.png",
        priority = "extra-high",
        width = 32,
        height = 32,
        frame_count = 1,
        variation_count = 1
      }
    }
  }
})
