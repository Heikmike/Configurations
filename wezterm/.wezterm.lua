local wezterm = require 'wezterm'
local config = {}

-- Colors
config.color_scheme = "Catppuccin Frappe"
config.colors = {
  background = "#232634",
}

-- Fonts
config.font = wezterm.font_with_fallback {
  "Hack Nerd Font Mono",
  "Fira Code Nerd Font Mono",
}
config.font_size = 16.0

-- Window
config.enable_tab_bar = false
config.window_padding = {
  left = "50pt",
  right = "50pt",
  top = "30pt",
  bottom = "0pt",
}

return config
