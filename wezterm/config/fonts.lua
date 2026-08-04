local M = {}

M.apply = function(config)
	local wezterm = require("wezterm")
	config.font = wezterm.font("Iosevka Nerd Font Mono")
  config.font_size = 18
  -- config.font = wezterm.font 'Maple Mono Normal NF CN'
  -- config.font = wezterm.font 'Maple Mono NF CN'
  -- config.font = wezterm.font 'Monaspace Radon'
  -- config.font = wezterm.font 'Monaspace Neon'
  -- config.font = wezterm.font 'Hack Nerd Font Mono'
  -- config.font = wezterm.font 'Jetbrains Mono'
  -- config.font = wezterm.font 'Google Sans Code'
  -- config.font = wezterm.font("Departure Mono")
end

return M
