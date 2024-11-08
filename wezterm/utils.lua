local wezterm = require 'wezterm'


local cycle_panes_callback = wezterm.action_callback(function(_, pane)
  local tab = pane:tab()
  local panes = tab:panes()

  if #panes == 1 then
    return
  end

  local cur_pane_found = false

  for _, p in ipairs(panes) do
    if cur_pane_found then
      p:activate()
      return
    end

    if p:pane_id() == pane:pane_id() then
      cur_pane_found = true
    end
  end

  panes[1]:activate()
end)

local utils = {
  cycle_panes = cycle_panes_callback,
}

return utils
