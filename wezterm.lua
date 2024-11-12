-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = true

-- Leader is the same as my old tmux prefix
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
  { key = "1", mods = "LEADER", action = act.ActivateTab(0) },
  { key = "2", mods = "LEADER", action = act.ActivateTab(1) },
  { key = "3", mods = "LEADER", action = act.ActivateTab(2) },
  { key = "4", mods = "LEADER", action = act.ActivateTab(3) },
  { key = "5", mods = "LEADER", action = act.ActivateTab(4) },
  { key = "6", mods = "LEADER", action = act.ActivateTab(5) },
  { key = "7", mods = "LEADER", action = act.ActivateTab(6) },
  { key = "8", mods = "LEADER", action = act.ActivateTab(7) },
  { key = "9", mods = "LEADER", action = act.ActivateTab(8) },

  { key = "h", mods = "LEADER", action = act.AdjustPaneSize({ "Left", 1 }) },
  { key = "q", mods = "LEADER", action = act.PaneSelect },

  { key = "c", mods = "LEADER", action = act.SpawnTab({ DomainName = "unix" }) },
  { key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },

  { key = '"', mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "%", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

  { key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
  { key = "[", mods = "LEADER", action = act.ActivateCopyMode },

  -- {
  --     key = 'C',
  --     mods = 'CTRL',
  --     action = wezterm.action.CopyTo 'ClipboardAndPrimarySelection',
  --   },

  { key = "Space", mods = "LEADER", action = act.RotatePanes("Clockwise") },
  { key = "o", mods = "LEADER", action = act.PaneSelect({ mode = "SwapWithActive" }) },
  {
    key = ",",
    mods = "LEADER",
    action = act.PromptInputLine({
      description = "Enter new name for tab",
      initial_value = "My Tab Name",
      action = wezterm.action_callback(function(window, pane, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:active_tab():set_title(line)
        end
      end),
    }),
  },
}

local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
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
