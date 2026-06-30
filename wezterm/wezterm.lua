local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- config.color_scheme = 'Builtin Dark'
config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = 'carbonfox'
-- config.color_scheme = 'Everforest Dark (Gogh)'
-- config.color_scheme = 'Wez'
-- config.color_scheme = 'Dracula (Official)'

-- config.font = wezterm.font 'Maple Mono Normal NF CN'
-- config.font = wezterm.font 'Maple Mono NF CN'
-- config.font = wezterm.font 'Jetbrains Mono'
config.font = wezterm.font 'Google Sans Code'
-- config.font = wezterm.font 'Monaspace Radon'
-- config.font = wezterm.font 'Monaspace Neon'
-- config.font = wezterm.font 'Hack Nerd Font'
-- config.font = wezterm.font("Departure Mono")
config.font_size = 17

config.force_reverse_video_cursor = true

config.initial_rows = 35
config.initial_cols = 120

config.window_decorations = "TITLE | RESIZE"
-- config.window_decorations = "RESIZE"
config.window_background_opacity = 0.75
config.macos_window_background_blur = 10
config.window_padding = {
	left = "0cell",
	right = "0cell",
	top = "0cell",
	bottom = "0cell",
}
config.adjust_window_size_when_changing_font_size = false

-- Spawn a fish shell in login mode
config.default_prog = { "/usr/local/bin/fish", "-l" }

-- 应用 UI 配置
-- local ui = require 'ui'
-- ui.apply_to_config(config)
-- ui.setup()

local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
bar.apply_to_config(config, {
	modules = {
		username = {
			enabled = false,
		},
		hostname = {
			enabled = false,
		},
	},
})

-- local utils = require("utils")
-- utils.load_plugins()

return config
