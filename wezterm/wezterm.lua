local wezterm = require 'wezterm'
local keymaps = require 'keymaps'

local config = {

  leader = { key = 'd', mods = 'CMD', timeout_milliseconds = 1000 },

  -- Keybindings
  keys = {
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
  },

  -- Colors
  color_scheme = 'Kanagawa (Gogh)',

  -- Fonts
  font = wezterm.font_with_fallback {
    'NotoMono NFM',
    'Hack Nerd Font Mono',
    'Fira Code Nerd Font Mono',
  },
  font_size = 16,

  -- Window
  enable_tab_bar = false,
  window_padding = {
    left = '30pt',
    right = '30pt',
    top = '15pt',
    bottom = '0pt',
  },

  warn_about_missing_glyphs = false,
}

return config
