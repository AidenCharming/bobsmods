local ore_icons = require("prototypes.ore-icons")

bobmods.ores.lead = {
  name = "lead-ore",
  tint = { r = 0.5, g = 0.5, b = 0.5 },
  map_color = { r = 0.5, g = 0.5, b = 0.5 },
  mining_time = 1,
  enabled = false,
  icons = ore_icons.create_ore_icons("lead-ore"),
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

function bobmods.ores.lead.create_autoplace()
  data.raw.resource["lead-ore"].autoplace = bobmods.lib.resource_autoplace.resource_autoplace_settings({
    name = "lead-ore",
    order = "c",
    base_density = 4,
    has_starting_area_placement = false,
    regular_rq_factor_multiplier = 0.8,
    starting_rq_factor_multiplier = 1.0,
    patch_set_name = "lead",
    base_spots_per_km2 = 1.0,
    random_spot_size_minimum = 0.5,
    random_spot_size_maximum = 2.0
  })
  bobmods.ores.lead.enabled = true
end

data:extend({
  {
    type = "item",
    name = "lead-ore",
    icons = ore_icons.create_ore_icons("lead-ore"),
    subgroup = "bob-ores",
    order = "b-lead",
    stack_size = 200,
    pictures = {
      {filename = "__bobores__/graphics/icons/lead-ore.png", size = 32, mipmap_count = 4}
    }
  },
  {
    type = "resource",
    name = "lead-ore",
    icons = ore_icons.create_ore_icons("lead-ore"),
    flags = {"placeable-neutral"},
    order = "b-lead",
    map_color = {r=0.5, g=0.5, b=0.5},
    mining_time = 1,
    mining_visualisation_tint = {r = 0.5, g = 0.5, b = 0.5},
    resource_patch_search_radius = 1.5,
    minimum_resource_amount = 35,
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 1,
      results = {{type = "item", name = "lead-ore", amount_min = 1, amount_max = 1}},
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    autoplace = "control-only",
    stage_counts = {2000},
    stages = {
      sheet = {
        filename = "__bobores__/graphics/entity/lead-ore/lead-ore.png",
        priority = "extra-high",
        width = 32,
        height = 32,
        frame_count = 1,
        variation_count = 1
      }
    }
  }
})
