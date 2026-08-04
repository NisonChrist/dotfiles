local M = {}

function M.apply(config)
	-- local constants = require("config.constants")
	-- 配色方案（默认）
	config.color_scheme = "rose-pine"
	-- config.color_scheme = 'catppuccin-frappe'
	-- config.color_scheme = 'Builtin Dark'
	-- config.color_scheme = "Catppuccin Mocha"
	-- config.color_scheme = 'carbonfox'
	-- config.color_scheme = 'Everforest Dark (Gogh)'
	-- config.color_scheme = 'Wez'

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
	-- 渲染设置
	config.max_fps = 120
	config.front_end = "WebGpu"
	config.webgpu_power_preference = "HighPerformance"

	-- 窗口透明度
	-- config.window_background_opacity = 1

	-- 背景图片（如需启用请取消注释）
	-- config.window_background_image = constants.CONFIG_DIR .. "/images/4.jpg"

	-- 窗口边距
	-- config.window_padding = {
	--     left = 0,
	--     right = 0,
	--     top = 0,
	--     bottom = 0,
	-- }

	-- 滚动条颜色
	-- config.colors = config.colors or {}
	-- config.colors.scrollbar_thumb = "#242936"

	-- 命令面板样式（磨砂深色）
	-- config.command_palette_bg_color = "rgba(12, 14, 20, 0.92)"
	-- config.command_palette_fg_color = "#e6e9ef"
end

return M
