local wezterm = require 'wezterm'
local action = wezterm.action
local utils = require 'utils'

local keymaps = {
  split_vertical = {
    mods = 'CMD',
    key = '-',
    action = action.SplitVertical { domain = "CurrentPaneDomain" },
  },

  split_vertical_small = {
    mods = 'CMD',
    key = 't',
    action = action.SplitPane {
      direction = "Down",
      size = { Percent = 30 },
    },
  },

  split_horizontal = {
    mods = 'CMD',
    key = '=',
    action = action.SplitHorizontal { domain = "CurrentPaneDomain" },
  },

  toggle_pane_zoom = {
    mods = 'CMD',
    key = 'z',
    action = action.TogglePaneZoomState,
  },

  rotate_panes = {
    mods = 'CMD',
    key = 'm',
    action = action.RotatePanes 'Clockwise',
  },

  close_pane = {
    mods = 'CMD',
    key = 'w',
    action = action.CloseCurrentPane { confirm = false },
  },

  go_left_pane = {
    mods = 'CMD',
    key = 'h',
    action = action.ActivatePaneDirection 'Left',
  },

  go_right_pane = {
    mods = 'CMD',
    key = 'l',
    action = action.ActivatePaneDirection 'Right',
  },

  go_top_pane = {
    mods = 'CMD',
    key = 'k',
    action = action.ActivatePaneDirection 'Up',
  },

  go_down_pane = {
    mods = 'CMD',
    key = 'j',
    action = action.ActivatePaneDirection 'Down',
  },

  go_next_pane = {
    mods = 'CMD',
    key = 'Tab',
    action = action.ActivatePaneDirection 'Next',
  },
}

return keymaps
