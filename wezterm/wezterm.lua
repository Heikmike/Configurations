local wezterm = require 'wezterm'
local keymaps = require 'keymaps'

local config = {}

config.leader = { key='d', mods='CMD', timeout_milliseconds=1000 }

-- Keybindings
config.keys = {
  keymaps.split_vertical,
  keymaps.split_vertical_small,
  keymaps.split_horizontal,
  keymaps.toggle_pane_zoom,
  keymaps.rotate_panes,
  keymaps.close_pane,
  keymaps.go_left_pane,
  keymaps.go_right_pane,
  keymaps.go_top_pane,
  keymaps.go_down_pane,
  keymaps.go_next_pane,
}

-- Colors
config.color_scheme = 'rose-pine'

-- Fonts
config.font = wezterm.font_with_fallback {
  'Hack Nerd Font Mono',
  'Fira Code Nerd Font Mono',
}
config.font_size = 12.0

-- Window
config.enable_tab_bar = false
config.window_padding = {
  left = '30pt',
  right = '30pt',
  top = '15pt',
  bottom = '0pt',
}

config.warn_about_missing_glyphs = false

return config
