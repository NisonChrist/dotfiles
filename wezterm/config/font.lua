local M = {}

M.apply = function(config)
	local wezterm = require("wezterm")
	config.font = wezterm.font("Iosevka Nerd Font") -- 'Maple Mono NF CN', 'Hack Nerd Font Mono', 'Jetbrains Mono'
  config.font_size = 19
end

return M
