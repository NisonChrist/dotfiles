local wezterm = require 'wezterm'

local config = {}

-- config.color_scheme = 'Builtin Dark'
-- config.color_scheme = 'Catppuccin Macchiato'
-- config.color_scheme = 'Everforest Dark (Gogh)'
-- config.color_scheme = 'Wez'
-- config.color_scheme = 'Dracula (Official)'
config.color_scheme = 'Solarized Dark - Patched'

config.font = wezterm.font 'Maple Mono Normal NF CN'
-- config.font = wezterm.font 'Jetbrains Mono'
-- config.font = wezterm.font 'Google Sans Code'
-- config.font = wezterm.font 'Monaspace Radon'
-- config.font = wezterm.font 'Monaspace Neon'
config.font_size = 15

config.force_reverse_video_cursor = true

config.initial_rows = 35
config.initial_cols = 120

config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false

-- config.window_decorations = "TITLE | RESIZE"
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.85
config.macos_window_background_blur = 10
config.window_padding = {
  left = '0.5cell',
  right = '0.5cell',
  top = '0.5cell',
  bottom = '0.5cell',
}

-- Spawn a fish shell in login mode
config.default_prog = { '/usr/local/bin/fish', '-l' }

return config
