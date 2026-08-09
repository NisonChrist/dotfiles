local M = {}

local wezterm = require("wezterm")

local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")

M.plugin = bar

M.config = {
  position = "top",
	modules = {
		username = {
			enabled = false,
		},
		hostname = {
			enabled = false,
		},
	},
}

return M
