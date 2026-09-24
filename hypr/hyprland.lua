-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

local hyprland_sripts_directory = os.getenv("HOME") .. "/.config/hypr/scripts"
local dunst_scripts_directory = os.getenv("HOME") .. "/.config/dunst/scripts"
local mainmod = "SUPER"
local second_monitor_name = "DP-1"

function Monitors()
  hl.monitor({
    output   = second_monitor_name,
    mode     = "2560x1600@59.97",
    position = "1600x0",
    scale    = "1.6",
  })
  hl.monitor({
    output   = "eDP-1",
    mode     = "3200x2000@120.00",
    position = "0x0",
    scale    = "2",
  })
end

Monitors()

function Workspaces()
  for i = 1, 10 do
    hl.workspace_rule({ workspace = tostring(i), monitor = second_monitor_name })
    hl.workspace_rule({ workspace = tostring(i + 5), monitor = "eDP-1" })
  end

  for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainmod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainmod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
  end
end

Workspaces()

local function keybindings()
  hl.bind(mainmod .. "+ RETURN", hl.dsp.exec_cmd("wezterm"))
  hl.bind(mainmod .. "+ X", hl.dsp.exec_cmd("firefox"))
  hl.bind(mainmod .. "+ Q", hl.dsp.window.close())
  -- hl.bind(mainMod .. "+ L", hl.dsp.exec_cmd("swaylock -f"))

  -- Volume and brightness
  hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(hyprland_sripts_directory .. "/volume up"))
  hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(hyprland_sripts_directory .. "/volume down"))
  hl.bind("XF86AudioMute", hl.dsp.exec_cmd(hyprland_sripts_directory .. "/volume mute"))
  hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(hyprland_sripts_directory .. "/brightness up"))
  hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(hyprland_sripts_directory .. "/brightness down"))
  hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
  hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
  hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
  hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

  -- Screenshots
  hl.bind("Print", hl.dsp.exec_cmd(hyprland_sripts_directory .. "/screenshot.sh"))

  -- Window resize and focus
  hl.bind(mainmod .. "+ F", hl.dsp.window.fullscreen({
    mode = "fullscreen",
    action = "toggle"
  }))
  hl.bind(mainmod .. "+ Tab", hl.dsp.window.cycle_next())

  -- Vicinae
  hl.bind(mainmod .. "+ Space", hl.dsp.exec_cmd("vicinae toggle"))
  hl.bind(mainmod .. "+ C", hl.dsp.exec_cmd("vicinae vicinae://launch/clipboard/history"))
  hl.bind(mainmod .. "+ B", hl.dsp.exec_cmd("vicinae vicinae://launch/@knoopx/store.vicinae.firefox/bookmarks"))
  hl.bind(mainmod .. "+ L", hl.dsp.exec_cmd("vicinae vicinae://launch/@heikel/search-with-firefox/search-firefox"))
end

keybindings()

function Autostart()
  hl.on("hyprland.start", function()
    hl.exec_cmd(hyprland_sripts_directory .. "sleep.sh")
    hl.exec_cmd(dunst_scripts_directory .. "battery.sh")
    hl.exec_cmd("wpaperd -d")
    hl.exec_cmd("rm ~/Pictures/Screenshots/*")
    hl.exec_cmd("redshift")
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 30")
    hl.exec_cmd("sudo systemctl start evremap.service")
    hl.exec_cmd("sudo systemctl start bluetooth.service")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("hyprpm reload -n")
    hl.exec_cmd("waybar")
    hl.exec_cmd("vicinae server")
  end)
end

Autostart()

hl.config({
  general = {
    gaps_in          = 3,
    gaps_out         = 30,
    border_size      = 0,
    col              = {
      active_border   = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
      inactive_border = "rgba(595959aa)",
    },
    -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
    resize_on_border = true,
    -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
    allow_tearing    = false,
    layout           = "scrolling",
  },

  decoration = {
    rounding         = 3,
    rounding_power   = 5,
    -- Change transparency of focused and unfocused windows
    active_opacity   = 0.9,
    inactive_opacity = 0.5,
    shadow           = {
      enabled      = false,
      range        = 4,
      render_power = 3,
      color        = "0xee1a1a1a",
    },
    blur             = {
      enabled = true,
      size = 10,
    },
  },
  animations = {
    enabled = true,
  },
})

local function animations()
  -- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
  hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
  hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
  hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
  hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
  hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

  -- Default springs
  hl.curve("easy", { type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333 })

  hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
  hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
  hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
  hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
  hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
  hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
  hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
  hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
  hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
  hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
  hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
  hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
  hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
  hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
  hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
  hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
  hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })
end

animations()

local function scrolling_layout()
  hl.config({
    scrolling = {
      fullscreen_on_one_column = true,
    },
  })
  hl.bind(mainmod .. " + period", hl.dsp.layout("move +col"))
  hl.bind(mainmod .. " + comma", hl.dsp.layout("move -col"))
end

scrolling_layout()

hl.config({
  misc = {
    force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
    disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
  },
})

local monitors = hl.get_monitors()
print(monitors)

hl.config({
  input = {
    kb_layout    = "us,ch",
    kb_variant   = ",fr",
    kb_model     = "pc105",
    kb_options   = "caps:swapescape",
    kb_rules     = "evdev",
    follow_mouse = 1,
    sensitivity  = 0, -- -1.0 - 1.0, 0 means no modification.
    repeat_delay = 400,
    repeat_rate = 50,
    touchpad     = {
      natural_scroll = true,
    },
  },
  xwayland = { force_zero_scaling = true }
})

-- Move focus with mainMod + arrow keys
hl.bind(mainmod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainmod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainmod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainmod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Example special workspace (scratchpad)
hl.bind(mainmod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainmod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
  -- Ignore maximize requests from all apps. You'll probably like this.
  name           = "suppress-maximize-events",
  match          = { class = ".*" },

  suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(false)
-- toolkit-specific scale
hl.env("GDK_SCALE", "2")
hl.env("XCURSOR_SIZE", "32")

hl.window_rule({
  -- Fix some dragging issues with XWayland
  name     = "fix-xwayland-drags",
  match    = {
    class      = "^$",
    title      = "^$",
    xwayland   = true,
    float      = true,
    fullscreen = false,
    pin        = false,
  },

  no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
  name  = "move-hyprland-run",
  match = { class = "hyprland-run" },

  move  = "20 monitor_h-120",
  float = true,
})
