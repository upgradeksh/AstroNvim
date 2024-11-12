-- Pull in the wezterm API
local wezterm = require "wezterm"
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Leader is the same as my old tmux prefix
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
  -- create new tab
  {
    mods = "LEADER",
    key = "c",
    action = act.SpawnTab { DomainName = "unix" },
  },
  -- splitting
  {
    mods = "LEADER",
    key = '"',
    action = act.SplitVertical { domain = "CurrentPaneDomain" },
  },
  {
    mods = "LEADER",
    key = "%",
    action = act.SplitHorizontal { domain = "CurrentPaneDomain" },
  },
  {
    mods = "LEADER",
    key = "z",
    action = act.TogglePaneZoomState,
  },
  {
    mods = "LEADER",
    key = "[",
    action = act.ActivateCopyMode,
  },
  {
    mods = "LEADER",
    key = "Space",
    action = act.RotatePanes "Clockwise",
  },
  -- show the pane selection mode, but have it swap the active and selected panes
  {
    mods = "LEADER",
    key = "0",
    action = act.PaneSelect {
      mode = "SwapWithActive",
    },
  },
}

return config
