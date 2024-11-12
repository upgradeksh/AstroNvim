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

-- when using Wezterm nightly
-- this works with neovim plugin, "mrjones2014/smart-splits.nvim"
-- https://github.com/mrjones2014/smart-splits.nvim?tab=readme-ov-file#wezterm
local smart_splits = wezterm.plugin.require "https://github.com/mrjones2014/smart-splits.nvim"
-- you can put the rest of your Wezterm config here
smart_splits.apply_to_config(config, {
  -- the default config is here, if you'd like to use the default keys,
  -- you can omit this configuration table parameter and just use
  -- smart_splits.apply_to_config(config)

  -- directional keys to use in order of: left, down, up, right
  -- direction_keys = { "h", "j", "k", "l" },
  -- if you want to use separate direction keys for move vs. resize, you
  -- can also do this:
  direction_keys = {
    move = { "h", "j", "k", "l" },
    resize = { "LeftArrow", "DownArrow", "UpArrow", "RightArrow" },
  },
  -- modifier keys to combine with direction_keys
  modifiers = {
    move = "CTRL", -- modifier to use for pane movement, e.g. CTRL+h to move left
    resize = "META", -- modifier to use for pane resize, e.g. META+h to resize to the left
  },
})

return config
