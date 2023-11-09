local wezterm = require 'wezterm'

return {
  audible_bell = 'Disabled',
  color_scheme = 'GitHub Dark',
  font = wezterm.font_with_fallback {
    'UDEV Gothic 35NF',
    'SF Mono',
    'Menlo',
    'Monaco',
    'Noto Color Emoji',
  },
  font_size = 18,
  initial_cols = 120,
  initial_rows = 40,
  use_ime = true,
  leader = { key = 'z', mods = 'CTRL', timeout_milliseconds = 1000 },
  keys = {
    {
      key = "\"",
      mods = "LEADER",
      action = wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}},
    },
    {
      key = "%",
      mods = "LEADER",
      action = wezterm.action{SplitVertical={domain="CurrentPaneDomain"}},
    },
  },
}
