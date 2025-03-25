local function create_ore_icon(name)
  return {
    icon = "__bobores__/graphics/icons/" .. name .. ".png",
    icon_size = 32,
    icon_mipmaps = 4
  }
end

local function create_ore_icons(name)
  return {
    {
      icon = "__bobores__/graphics/icons/" .. name .. ".png",
      icon_size = 32,
      icon_mipmaps = 4
    }
  }
end

return {
  create_ore_icon = create_ore_icon,
  create_ore_icons = create_ore_icons
} 