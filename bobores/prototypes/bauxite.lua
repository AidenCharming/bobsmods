local ore_icons = require("prototypes.ore-icons")

bobmods.ores.bauxite = {
  name = "bob-bauxite-ore",
  tint = { r = 0.777, g = 0.7, b = 0.333 },
  map_color = { r = 0.777, g = 0.7, b = 0.333 },
  mining_time = 1,
  enabled = false,
  icons = ore_icons.create_ore_icons("bauxite"),
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

function bobmods.ores.bauxite.create_autoplace()
  data.raw.resource["bob-bauxite-ore"].autoplace = bobmods.lib.resource_autoplace.resource_autoplace_settings({
    name = "bob-bauxite-ore",
    order = "b",
    base_density = 8,
    has_starting_area_placement = false,
    regular_rq_factor_multiplier = 1.1,
    starting_rq_factor_multiplier = 1.2,
    patch_set_name = "bauxite",
    base_spots_per_km2 = 1.8,
    random_spot_size_minimum = 0.5,
    random_spot_size_maximum = 2.0
  })
  bobmods.ores.bauxite.enabled = true
end
