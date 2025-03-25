local ore_icons = require("prototypes.ore-icons")

bobmods.ores.cobalt = {
  name = "bob-cobalt-ore",
  tint = { r = 0.3, g = 0.53, b = 0.77 },
  map_color = { r = 0.3, g = 0.53, b = 0.77 },
  mining_time = 1.5,
  enabled = false,
  icons = ore_icons.create_ore_icons("cobalt-ore"),
  stage_mult = 100,
  item = {
    create = true,
    create_variations = true,
    subgroup = "bob-ores",
  },
  sprite = {
    sheet = 1,
  },
  --[[  autoplace = 
  {
    create = true,
    starting_area = false,
    richness = 0.6,
    size = 1
  }
]]
  --
  autoplace = "control-only",
  planets = { "nauvis" },
  minimum_resource_amount = 35
}

function bobmods.ores.cobalt.create_autoplace()
  data.raw.resource["bob-cobalt-ore"].autoplace = bobmods.lib.resource_autoplace.resource_autoplace_settings({
    name = "bob-cobalt-ore",
    order = "c",
    base_density = 4,
    has_starting_area_placement = false,
    regular_rq_factor_multiplier = 0.8,
    starting_rq_factor_multiplier = 1.0,
    patch_set_name = "cobalt",
    base_spots_per_km2 = 1.2,
    random_spot_size_minimum = 0.5,
    random_spot_size_maximum = 2.0
  })
  bobmods.ores.cobalt.enabled = true
end
