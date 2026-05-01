local wezterm = require("wezterm")
local palette = require("ui.palette")
local utils = require("ui.utils")
local stats = require("ui.stats")

local M = {}

local C = palette.carbonfox

-- 格式化 tab 标题
function M.format_tab_title(tab, tabs, panes, config, hover, max_width)
  local process_name = utils.get_process_name(tab)
  local icon = utils.get_process_icon(process_name)
  local dir = utils.get_current_directory(tab)
  _ = panes
  _ = config

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

  local foreground
  local bracket_color

  if tab.is_active then
    foreground = C.fg1
    bracket_color = C.blue
  elseif hover then
    foreground = C.fg
    bracket_color = C.bg4
  else
    foreground = C.fg3
    bracket_color = C.bg4
  end

  -- 判断是否是最后一个 tab
  local is_last = tab.tab_index == #tabs - 1

  -- 判断是否是第一个 tab
  local is_first = tab.tab_index == 0

  local elements = {
    { Background = { Color = C.bg0 } },
  }

  -- 如果是第一个 tab，添加左侧 padding
  if is_first then
    table.insert(elements, { Text = " " })
  end

  table.insert(elements, { Foreground = { Color = bracket_color } })
  table.insert(elements, { Foreground = { Color = foreground } })
  table.insert(elements, { Attribute = { Intensity = tab.is_active and "Bold" or "Normal" } })
  table.insert(elements, { Text = title_content })
  table.insert(elements, { Attribute = { Intensity = "Normal" } })
  table.insert(elements, { Foreground = { Color = bracket_color } })

  -- 添加分隔符
  table.insert(elements, { Foreground = { Color = C.bg4 } })
  table.insert(elements, { Text = " | " })

  return elements
end

-- 更新右侧状态栏
function M.update_right_status(window, pane)
  -- 获取当前工作目录
  local cwd = ""
  local cwd_uri = pane:get_current_working_dir()
  if cwd_uri then
    cwd = cwd_uri.file_path or ""
    -- 缩短路径，将 home 目录替换为 ~（转义特殊字符以安全用于 gsub）
    local home = os.getenv("HOME")
    if home then
      cwd = cwd:gsub("^" .. utils.escape_pattern(home), "~")
    end
    -- 如果路径太长，只保留后面部分
    if #cwd > 40 then
      cwd = "…" .. cwd:sub(-38)
    end
  end

  -- 获取 CPU 使用率
  local sys = stats.get_stats()
  local cpu_text = sys.cpu and (sys.cpu .. "%") or "N/A"
  local cpu_color = stats.usage_color(sys.cpu, C)

  -- 获取当前时间
  local time = wezterm.strftime("%H:%M:%S")
  local date = wezterm.strftime("%Y-%m-%d %a")

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
    -- CWD
    { Foreground = { Color = C.fg3 } },
    { Text = wezterm.nerdfonts.md_folder .. " " },
    { Foreground = { Color = C.fg3 } },
    { Text = cwd .. "  " },
    { Foreground = { Color = C.bg3 } },
    { Text = "│  " },
    -- CPU
    { Foreground = { Color = C.fg3 } },
    { Text = wezterm.nerdfonts.oct_cpu .. " " },
    { Foreground = { Color = cpu_color } },
    { Text = cpu_text .. "  " },
    { Foreground = { Color = C.bg3 } },
    { Text = "│  " },
    -- 日期 / 时间
    { Foreground = { Color = C.fg3 } },
    { Text = wezterm.nerdfonts.md_calendar .. " " },
    { Foreground = { Color = C.fg3 } },
    { Text = date .. "  " },
    { Foreground = { Color = C.fg3 } },
    { Text = wezterm.nerdfonts.md_clock_outline .. " " },
    { Foreground = { Color = C.fg3 } },
    { Text = time .. "  " },
    -- 电池
    { Foreground = { Color = C.fg3 } },
    { Text = battery .. " " },
  }))
end

-- 应用配置
function M.apply_to_config(config)
  -- 使用 retro tab bar 以便自定义
  config.use_fancy_tab_bar = false
  config.tab_bar_at_bottom = false
  config.hide_tab_bar_if_only_one_tab = false -- 保持 tab bar 显示以展示状态栏

  -- Tab bar 颜色配置
  config.colors = config.colors or {}
  config.colors.tab_bar = {
    background = C.bg0,
    active_tab = {
      bg_color = C.bg3,
      fg_color = C.fg1,
      intensity = "Bold",
    },
    inactive_tab = {
      bg_color = C.bg,
      fg_color = C.fg3,
    },
    inactive_tab_hover = {
      bg_color = C.bg2,
      fg_color = C.fg2,
    },
    new_tab = {
      bg_color = C.bg0,
      fg_color = C.fg3,
    },
    new_tab_hover = {
      bg_color = C.bg3,
      fg_color = C.fg1,
    },
  }

  -- 状态栏刷新间隔（毫秒）
  config.status_update_interval = 1000

  -- Tab bar 样式
  config.tab_max_width = 32
  config.show_tab_index_in_tab_bar = false
  config.show_new_tab_button_in_tab_bar = true

  -- 窗口边框
  config.window_frame = {
    font = wezterm.font({ family = "Maple Mono Normal NF CN", weight = "Bold" }),
    font_size = 15.0,
    active_titlebar_bg = C.bg0,
    inactive_titlebar_bg = C.bg0,
  }
end

-- 设置事件处理器
function M.setup()
  wezterm.on("format-tab-title", M.format_tab_title)
  wezterm.on("update-right-status", M.update_right_status)
end

return M
