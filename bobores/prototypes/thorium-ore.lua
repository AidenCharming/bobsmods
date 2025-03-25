local ore_icons = require("prototypes.ore-icons")

bobmods.ores.thorium = {
  name = "thorium-ore",
  tint = { r = 0.4, g = 1.0, b = 0.4 },
  map_color = { r = 0.4, g = 1.0, b = 0.4 },
  mining_time = 2,
  enabled = false,
  icons = ore_icons.create_ore_icons("thorium-ore"),
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

function bobmods.ores.thorium.create_autoplace()
  data.raw.resource["thorium-ore"].autoplace = bobmods.lib.resource_autoplace.resource_autoplace_settings({
    name = "thorium-ore",
    order = "c",
    base_density = 3,
    has_starting_area_placement = false,
    regular_rq_factor_multiplier = 0.7,
    starting_rq_factor_multiplier = 1.0,
    patch_set_name = "thorium",
    base_spots_per_km2 = 0.8,
    random_spot_size_minimum = 0.5,
    random_spot_size_maximum = 2.0
  })
  bobmods.ores.thorium.enabled = true
end

data:extend({
  {
    type = "item",
    name = "thorium-ore",
    icons = {
      {
        icon = "__base__/graphics/icons/stone.png",
        icon_size = 64,
        icon_mipmaps = 4,
        tint = {r = 0.4, g = 1.0, b = 0.4}
      }
    },
    subgroup = "bob-ores",
    order = "b-thorium",
    stack_size = 200,
    pictures = {
      {
        filename = "__base__/graphics/icons/stone.png",
        size = 64,
        scale = 0.5,
        mipmap_count = 4,
        tint = {r = 0.4, g = 1.0, b = 0.4}
      }
    }
  },
  {
    type = "resource",
    name = "thorium-ore",
    icons = ore_icons.create_ore_icons("thorium-ore"),
    flags = {"placeable-neutral"},
    order = "b-thorium",
    map_color = {r=0.4, g=1.0, b=0.4},
    mining_time = 2,
    mining_visualisation_tint = {r = 0.4, g = 1.0, b = 0.4},
    resource_patch_search_radius = 1.5,
    minimum_resource_amount = 30,
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 2,
      results = {{type = "item", name = "thorium-ore", amount_min = 1, amount_max = 1}},
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    autoplace = bobmods.lib.resource_autoplace.resource_autoplace_settings({
      name = "thorium-ore",
      order = "c",
      base_density = 3,
      has_starting_area_placement = false,
      regular_rq_factor_multiplier = 0.7,
      starting_rq_factor_multiplier = 1.0,
      patch_set_name = "thorium",
      base_spots_per_km2 = 0.8,
      random_spot_size_minimum = 0.5,
      random_spot_size_maximum = 2.0
    }),
    stage_counts = {2000},
    stages = {
      sheet = {
        filename = "__bobores__/graphics/entity/thorium-ore/thorium-ore.png",
        priority = "extra-high",
        width = 32,
        height = 32,
        frame_count = 1,
        variation_count = 1
      }
    }
  }
})
