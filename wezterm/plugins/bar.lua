local wezterm = require("wezterm")
local config = wezterm.config_builder()
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
