bobmods.ores.gems = {
  name = "bob-gem-ore",
  map_color = { r = 0.25, g = 1, b = 0.25 },
  mining_time = 2.5,
  enabled = false,
  icon = "__bobores__/graphics/icons/gem-ore.png",
  stage_mult = 2,
  particle = "gem-ore-particle",
  sprite = {
    filename = "__bobores__/graphics/entity/gem-ore/gem-ore.png",
    width = 38,
    height = 38,
    frame_count = 4,
    variation_count = 8,
    scale = 1,
  },
  autoplace = "control-only",
  planets = { "nauvis" },
  subgroup = "bob-ores",
}

function bobmods.ores.gems.create_autoplace()
  data.raw.resource["bob-gem-ore"].autoplace = bobmods.lib.resource_autoplace.resource_autoplace_settings({
    name = "bob-gem-ore",
    order = "c",
    base_density = 0.1,
    has_starting_area_placement = false,
    regular_rq_factor_multiplier = 1,
  })
  bobmods.ores.gems.enabled = true
end

data:extend({
  {
    type = "optimized-particle",
    name = "gem-ore-particle",
    life_time = 180,
    pictures = {
      {
        filename = "__bobores__/graphics/entity/gem-ore/gem-ore-particle-1.png",
        priority = "extra-high",
        width = 4,
        height = 3,
        frame_count = 1,
      },
      {
        filename = "__bobores__/graphics/entity/gem-ore/gem-ore-particle-2.png",
        priority = "extra-high",
        width = 3,
        height = 3,
        frame_count = 1,
      },
      {
        filename = "__bobores__/graphics/entity/gem-ore/gem-ore-particle-3.png",
        priority = "extra-high",
        width = 4,
        height = 4,
        frame_count = 1,
      },
      {
        filename = "__bobores__/graphics/entity/gem-ore/gem-ore-particle-4.png",
        priority = "extra-high",
        width = 6,
        height = 6,
        frame_count = 1,
      },
    },
    shadows = {
      {
        filename = "__bobores__/graphics/entity/gem-ore/gem-ore-particle-shadow-1.png",
        priority = "extra-high",
        width = 4,
        height = 3,
        frame_count = 1,
      },
      {
        filename = "__bobores__/graphics/entity/gem-ore/gem-ore-particle-shadow-2.png",
        priority = "extra-high",
        width = 3,
        height = 3,
        frame_count = 1,
      },
      {
        filename = "__bobores__/graphics/entity/gem-ore/gem-ore-particle-shadow-3.png",
        priority = "extra-high",
        width = 4,
        height = 4,
        frame_count = 1,
      },
      {
        filename = "__bobores__/graphics/entity/gem-ore/gem-ore-particle-shadow-4.png",
        priority = "extra-high",
        width = 6,
        height = 6,
        frame_count = 1,
      },
    },
  },
})

local ore_icons = require("prototypes.ore-icons")

if bobmods.ores.settings.UnsortedGemOre == true then
  data:extend({
    {
      type = "item",
      name = "bob-gem-ore",
      icons = ore_icons.create_ore_icons("gem-ore"),
      subgroup = "bob-gems-ore",
      order = "a-0[bob-gem-ore]",
      stack_size = 200,
      drop_sound = {
        filename = "__base__/sound/item/resource-inventory-move.ogg",
        volume = 0.8,
      },
      inventory_move_sound = {
        filename = "__base__/sound/item/resource-inventory-move.ogg",
        volume = 0.8,
      },
      pick_sound = {
        filename = "__base__/sound/item/resource-inventory-pickup.ogg",
        volume = 0.6,
      },
      weight = 2000,
    },
    {
      type = "recipe",
      name = "bob-sort-gem-ore",
      energy_required = 1,
      ingredients = {
        { type = "item", name = "bob-gem-ore", amount = 1 },
      },
      results = {
        { type = "item", name = "bob-ruby-ore", amount = 1, probability = bobmods.gems.RubyRatio },
        { type = "item", name = "bob-sapphire-ore", amount = 1, probability = bobmods.gems.SapphireRatio },
        { type = "item", name = "bob-emerald-ore", amount = 1, probability = bobmods.gems.EmeraldRatio },
        { type = "item", name = "bob-amethyst-ore", amount = 1, probability = bobmods.gems.AmethystRatio },
        { type = "item", name = "bob-topaz-ore", amount = 1, probability = bobmods.gems.TopazRatio },
        { type = "item", name = "bob-diamond-ore", amount = 1, probability = bobmods.gems.DiamondRatio },
      },
      subgroup = "bob-gems-ore",
      icons = ore_icons.create_ore_icons("gem-ore"),
      order = "a-0",
      allow_productivity = true,
      hide_from_signal_gui = false,
    },
    {
      type = "resource",
      name = "bob-gem-ore",
      icons = ore_icons.create_ore_icons("gem-ore"),
      flags = {"placeable-neutral"},
      order = "b-gems-unsorted",
      map_color = {r = 0.8, g = 0.8, b = 0.8},
      mining_time = 2,
      mining_visualisation_tint = {r = 0.8, g = 0.8, b = 0.8},
      resource_patch_search_radius = 1.5,
      minimum_resource_amount = 25,
      minable =
      {
        mining_particle = "stone-particle",
        mining_time = 2,
        results = {{type = "item", name = "bob-gem-ore", amount_min = 1, amount_max = 1}},
      },
      collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
      selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
      autoplace = bobmods.lib.resource_autoplace.resource_autoplace_settings({
        name = "bob-gem-ore",
        order = "c",
        base_density = 0.75,
        has_starting_area_placement = false,
        regular_rq_factor_multiplier = 0.8,
        starting_rq_factor_multiplier = 1.0,
        patch_set_name = "gem",
        base_spots_per_km2 = 0.7,
        random_spot_size_minimum = 0.5,
        random_spot_size_maximum = 2.0
      }),
      stage_counts = {2000, 1600, 1400, 1200, 800, 400, 200, 10},
      stages = {
        sheet = {
          filename = "__bobores__/graphics/entity/gem-ore/gem-ore.png",
          priority = "extra-high",
          width = 32,
          height = 32,
          frame_count = 1,
          variation_count = 8
        }
      },
      stages_effect = {
        sheet = {
          filename = "__bobores__/graphics/entity/gem-ore/gem-ore-glow.png",
          priority = "extra-high",
          width = 64,
          height = 64,
          frame_count = 8,
          variation_count = 8,
          blend_mode = "additive",
          flags = {"light"},
          hr_version = {
            filename = "__bobores__/graphics/entity/gem-ore/hr-gem-ore-glow.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            frame_count = 8,
            variation_count = 8,
            scale = 0.5,
            blend_mode = "additive",
            flags = {"light"}
          }
        }
      }
    }
  })
end
