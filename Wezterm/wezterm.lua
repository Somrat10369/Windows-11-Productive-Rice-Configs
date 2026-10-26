-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║                       WEZTERM CONFIGURATION                              ║
-- ╚══════════════════════════════════════════════════════════════════════════╝

local wezterm = require "wezterm" ---@type Wezterm
local config = wezterm.config_builder() ---@type Config
local act = wezterm.action

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ 🎨 STATE & VARIABLES                                                     │
-- └──────────────────────────────────────────────────────────────────────────┘
local next_direction = "Right"

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ ⚙️ GENERAL & SHELL SETTINGS                                              │
-- └──────────────────────────────────────────────────────────────────────────┘
config.automatically_reload_config = true
config.default_prog = { "pwsh.exe", "-NoLogo" }

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ 🪟 WINDOW & APPEARANCE                                                   │
-- └──────────────────────────────────────────────────────────────────────────┘
config.window_background_opacity = 0.67
config.window_decorations = "RESIZE"
config.color_scheme_dirs = { "C:/Users/Somrat/.cache/wal" }
config.color_scheme = 'colors-wezterm'

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ 🔠 TYPOGRAPHY                                                            │
-- └──────────────────────────────────────────────────────────────────────────┘
config.font_size = 11
config.font = wezterm.font('MesloLGL Nerd Font Propo', { weight = 'Bold', italic = false })
config.line_height = 1

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ ⚡ PERFORMANCE & CURSOR                                                  │
-- └──────────────────────────────────────────────────────────────────────────┘
config.animation_fps = 60
config.max_fps = 120
config.cursor_blink_rate = 800
config.default_cursor_style = "SteadyBar"
config.hide_mouse_cursor_when_typing = true

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ 📑 TAB BAR CONFIGURATION                                                 │
-- └──────────────────────────────────────────────────────────────────────────┘
config.enable_tab_bar = false
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.adjust_window_size_when_changing_font_size = false

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ 🖱️ MOUSE BINDINGS                                                        │
-- └──────────────────────────────────────────────────────────────────────────┘
config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = "Right" } },
    mods = "NONE",
    action = wezterm.action_callback(function(window, pane)
      local has_selection = window:get_selection_text_for_pane(pane) ~= ""
      if has_selection then
        window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
        window:perform_action(act.ClearSelection, pane)
      else
        window:perform_action(act.PasteFrom("Clipboard"), pane)
      end
    end),
  },
}

-- ┌──────────────────────────────────────────────────────────────────────────┐
-- │ ⌨️ KEY BINDINGS & LOOP REGISTRATION                                      │
-- └──────────────────────────────────────────────────────────────────────────┘
config.keys = {}

local key_mappings = {
  -- Tabs & Windows Management
  {
    key = 't',
    mods = 'CTRL',
    action = act.SpawnTab 'CurrentPaneDomain',
  },
  {
    key = 'Tab',
    mods = 'CTRL',
    action = act.ActivateTabRelative(1),
  },
  {
    key = 'Tab',
    mods = 'SHIFT|CTRL',
    action = act.ActivateTabRelative(-1),
  },
  {
    key = 'w',
    mods = 'CTRL',
    action = wezterm.action_callback(function(window, pane)
      window:perform_action(act.CloseCurrentPane { confirm = false }, pane)
    end),
  },

  -- Font Resizing
  {
    key = '-',
    mods = 'CTRL',
    action = act.DecreaseFontSize,
  },
  {
    key = '=',
    mods = 'CTRL',
    action = act.IncreaseFontSize,
  },
  {
    key = '0',
    mods = 'CTRL',
    action = act.ResetFontSize,
  },

  -- Dynamic Pane Splitting & Direction Toggle
  {
    key = "n",
    mods = "CTRL",
    action = wezterm.action_callback(function(window, pane)
      pane:split {
        direction = next_direction,
        size = 0.5,
      }
      next_direction = next_direction == "Right" and "Bottom" or "Right"
    end),
  },
  {
    key = "n",
    mods = "CTRL|SHIFT",
    action = wezterm.action_callback(function()
      next_direction = next_direction == "Right" and "Bottom" or "Right"
    end),
  },
}

-- Register key bindings into the main config via loop
for _, binding in ipairs(key_mappings) do
  table.insert(config.keys, binding)
end

return config
