local M = {}

function M.apply(config)
	-- local constants = require("config.constants")
	-- Color scheme
	config.color_scheme = "Everforest Dark (Gogh)" --'Wez' 'rose-pine'

	config.force_reverse_video_cursor = true

	config.initial_rows = 35
	config.initial_cols = 120

	config.hide_tab_bar_if_only_one_tab = true
	config.window_decorations = "TITLE | RESIZE" -- "TITLE | RESIZE"
	config.window_background_opacity = 0.15 -- for full screen with background image
	-- config.window_background_opacity = 0.75
	-- config.macos_window_background_blur = 10
	config.window_padding = {
		left = "0cell",
		right = "0cell",
		top = "0.5cell",
		bottom = "0cell",
	}
	config.adjust_window_size_when_changing_font_size = false

	-- Rendering
	config.max_fps = 120
	config.front_end = "WebGpu"
	config.webgpu_power_preference = "HighPerformance"

	-- Background Image
	config.window_background_image = require("wezterm").config_dir .. "/assets/云彩-夜晚-夜景.png"

	-- Scrollbar Color
	-- config.enable_scroll_bar = true
	-- config.colors = config.colors or {}
	-- config.colors.scrollbar_thumb = "#242936"

	-- Command palette style (dark blur)
	-- config.command_palette_bg_color = "rgba(12, 14, 20, 0.92)"
	-- config.command_palette_fg_color = "#e6e9ef"
end

return M
