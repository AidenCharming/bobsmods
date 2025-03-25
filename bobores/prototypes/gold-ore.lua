local ore_icons = require("prototypes.ore-icons")

bobmods.ores.gold = {
  name = "bob-gold-ore",
  tint = { r = 1, g = 0.75, b = 0 },
  map_color = { r = 1, g = 0.7, b = 0 },
  mining_time = 0.75,
  enabled = false,
  icons = ore_icons.create_ore_icons("gold-ore"),
  stage_mult = 100,
  item = {
    create = true,
    create_variations = true,
    subgroup = "bob-ores",
  },
  sprite = {
    sheet = 2,
  },
  autoplace = "control-only",
  planets = { "nauvis" },
  minimum_resource_amount = 35  -- New in 2.0: minimum amount for resource patches
}

function bobmods.ores.gold.create_autoplace()
  data.raw.resource["bob-gold-ore"].autoplace = bobmods.lib.resource_autoplace.resource_autoplace_settings({
    name = "bob-gold-ore",
    order = "c",
    base_density = 4,
    has_starting_area_placement = false,
    regular_rq_factor_multiplier = 0.9,
    starting_rq_factor_multiplier = 1.0,  -- New in 2.0: control starting area richness
    patch_set_name = "gold",  -- New in 2.0: for consistent patch generation
    base_spots_per_km2 = 1.5,  -- New in 2.0: control patch frequency
    random_spot_size_minimum = 0.5,  -- New in 2.0: control minimum patch size
    random_spot_size_maximum = 2.0   -- New in 2.0: control maximum patch size
  })
  bobmods.ores.gold.enabled = true
end
