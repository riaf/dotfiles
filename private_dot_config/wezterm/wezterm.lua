local wezterm = require 'wezterm'

return {
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
}
