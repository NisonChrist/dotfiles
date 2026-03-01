local wezterm = require("wezterm")
local palette = require("ui.palette")
local utils = require("ui.utils")

local M = {}

local COLORS = palette.carbonfox

-- 格式化 tab 标题
function M.format_tab_title(tab, tabs, panes, config, hover, max_width)
	local process_name = utils.get_process_name(tab)
	local icon = utils.get_process_icon(process_name)
	local dir = utils.get_current_directory(tab)

	-- 构建标题内容
	local title_content
	if dir then
		title_content = string.format("%s %s", icon, dir)
	else
		title_content = string.format("%s %s", icon, process_name)
	end

	-- 如果标题太长，截断它
	if #title_content > max_width - 6 then
		title_content = wezterm.truncate_right(title_content, max_width - 1) .. "…"
	end

	-- Carbonfox 配色
	local colors = {
		bg = "#0c0c0c",
		fg = "#f2f4f8",
		active_fg = "#f2f4f8",
		inactive_fg = "#7b7c7e",
		bracket_active = "#78a9ff",
		bracket_inactive = "#353535",
		separator = "#353535",
	}

	local foreground
	local bracket_color

	if tab.is_active then
		foreground = colors.active_fg
		bracket_color = colors.bracket_active
	elseif hover then
		foreground = colors.fg
		bracket_color = colors.bracket_inactive
	else
		foreground = colors.inactive_fg
		bracket_color = colors.bracket_inactive
	end

	-- 判断是否是最后一个 tab
	local is_last = tab.tab_index == #tabs - 1

	-- 判断是否是第一个 tab，添加左侧 padding
	local is_first = tab.tab_index == 0

	local elements = {
		{ Background = { Color = colors.bg } },
	}

	-- 如果是第一个 tab，添加左侧 padding
	if is_first then
		table.insert(elements, { Text = " " })
	end

	table.insert(elements, { Foreground = { Color = bracket_color } })
	-- table.insert(elements, { Text = '[ ' })
	table.insert(elements, { Foreground = { Color = foreground } })
	table.insert(elements, { Attribute = { Intensity = tab.is_active and "Bold" or "Normal" } })
	table.insert(elements, { Text = title_content })
	table.insert(elements, { Attribute = { Intensity = "Normal" } })
	table.insert(elements, { Foreground = { Color = bracket_color } })
	-- table.insert(elements, { Text = ' ]' })

	-- 添加分隔符（如果不是最后一个 tab）
	if not is_last then
		table.insert(elements, { Foreground = { Color = colors.separator } })
		table.insert(elements, { Text = " | " })
	else
	  table.insert(elements, { Foreground = { Color = colors.separator } })
		table.insert(elements, { Text = " | " })
	end

	return elements
end

-- 更新右侧状态栏
function M.update_right_status(window, pane)
	-- Carbonfox 配色
	local colors = {
		bg = "#0c0c0c",
		fg = "#f2f4f8",
		accent = "#78a9ff",
		surface = "#353535",
		subtext = "#b6b8bb",
	}

	-- 获取当前工作目录
	local cwd = ""
	local cwd_uri = pane:get_current_working_dir()
	if cwd_uri then
		cwd = cwd_uri.file_path or ""
		-- 缩短路径，将 home 目录替换为 ~
		local home = os.getenv("HOME")
		if home then
			cwd = cwd:gsub("^" .. home, "~")
		end
		-- 如果路径太长，只保留后面部分
		if #cwd > 40 then
			cwd = "…" .. cwd:sub(-38)
		end
	end

	-- 获取当前时间
	-- local time = wezterm.strftime("%H:%M")
	-- local date = wezterm.strftime("%m/%d %a")
	local time = wezterm.strftime("%H:%M:%S")
	local date = wezterm.strftime '%Y-%m-%d %a'
	-- 获取电池状态
	local battery = ""
	for _, b in ipairs(wezterm.battery_info()) do
		local charge = b.state_of_charge * 100
		local icon
		if charge >= 90 then
			icon = wezterm.nerdfonts.md_battery
		elseif charge >= 70 then
			icon = wezterm.nerdfonts.md_battery_70
		elseif charge >= 50 then
			icon = wezterm.nerdfonts.md_battery_50
		elseif charge >= 30 then
			icon = wezterm.nerdfonts.md_battery_30
		elseif charge >= 10 then
			icon = wezterm.nerdfonts.md_battery_20
		else
			icon = wezterm.nerdfonts.md_battery_alert
		end
		battery = string.format("%s %.0f%%", icon, charge)
	end

	window:set_right_status(wezterm.format({
		{ Foreground = { Color = colors.subtext } },
		{ Text = wezterm.nerdfonts.md_folder .. " " },
		{ Foreground = { Color = colors.fg } },
		{ Text = cwd .. "  " },
		{ Foreground = { Color = colors.surface } },
		{ Text = "│  " },
		{ Foreground = { Color = colors.subtext } },
		{ Text = wezterm.nerdfonts.md_calendar .. " " },
		{ Foreground = { Color = colors.fg } },
		{ Text = date .. "  " },
		{ Foreground = { Color = colors.subtext } },
		{ Text = wezterm.nerdfonts.md_clock_outline .. " " },
		{ Foreground = { Color = colors.fg } },
		{ Attribute = { Intensity = "Normal" } },
		{ Text = time .. "  " },
		{ Attribute = { Intensity = "Normal" } },
		{ Foreground = { Color = colors.subtext } },
		{ Text = battery .. " " },
	}))
end

-- 应用配置
function M.apply_to_config(config)
	-- 使用 retro tab bar 以便自定义
	config.use_fancy_tab_bar = false
	config.tab_bar_at_bottom = false
	config.hide_tab_bar_if_only_one_tab = false -- 保持 tab bar 显示以展示状态栏

	-- Tab bar 颜色配置 (Carbonfox)
	config.colors = config.colors or {}
	config.colors.tab_bar = {
		background = "#0c0c0c",
		active_tab = {
			bg_color = "#282828",
			fg_color = "#f2f4f8",
			intensity = "Bold",
		},
		inactive_tab = {
			bg_color = "#161616",
			fg_color = "#7b7c7e",
		},
		inactive_tab_hover = {
			bg_color = "#1e1e1e",
			fg_color = "#b6b8bb",
		},
		new_tab = {
			bg_color = "#0c0c0c",
			fg_color = "#7b7c7e",
		},
		new_tab_hover = {
			bg_color = "#282828",
			fg_color = "#f2f4f8",
		},
	}

	-- Tab bar 样式
	config.tab_max_width = 32
	config.show_tab_index_in_tab_bar = false
	config.show_new_tab_button_in_tab_bar = true

	-- 窗口边框
	config.window_frame = {
		font = wezterm.font({ family = "Maple Mono Normal NF CN", weight = "Bold" }),
		font_size = 15.0,
		active_titlebar_bg = "#0c0c0c",
		inactive_titlebar_bg = "#0c0c0c",
	}
end

-- 设置事件处理器
function M.setup()
	wezterm.on("format-tab-title", M.format_tab_title)
	wezterm.on("update-right-status", M.update_right_status)
end

return M
