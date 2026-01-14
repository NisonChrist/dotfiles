local wezterm = require 'wezterm'

local M = {}

-- 获取进程图标
local function get_process_icon(process_name)
  local icons = {
    ['fish'] = wezterm.nerdfonts.md_fish,
    ['zsh'] = wezterm.nerdfonts.dev_terminal,
    ['bash'] = wezterm.nerdfonts.cod_terminal_bash,
    ['nvim'] = wezterm.nerdfonts.custom_vim,
    ['vim'] = wezterm.nerdfonts.custom_vim,
    ['node'] = wezterm.nerdfonts.md_nodejs,
    ['python'] = wezterm.nerdfonts.dev_python,
    ['python3'] = wezterm.nerdfonts.dev_python,
    ['ruby'] = wezterm.nerdfonts.dev_ruby,
    ['cargo'] = wezterm.nerdfonts.dev_rust,
    ['rustc'] = wezterm.nerdfonts.dev_rust,
    ['go'] = wezterm.nerdfonts.md_language_go,
    ['git'] = wezterm.nerdfonts.dev_git,
    ['lazygit'] = wezterm.nerdfonts.dev_git,
    ['lua'] = wezterm.nerdfonts.seti_lua,
    ['ssh'] = wezterm.nerdfonts.md_ssh,
    ['docker'] = wezterm.nerdfonts.dev_docker,
    ['htop'] = wezterm.nerdfonts.md_chart_areaspline,
    ['btop'] = wezterm.nerdfonts.md_chart_areaspline,
    ['top'] = wezterm.nerdfonts.md_chart_areaspline,
    ['make'] = wezterm.nerdfonts.seti_makefile,
    ['curl'] = wezterm.nerdfonts.md_download,
    ['wget'] = wezterm.nerdfonts.md_download,
  }
  return icons[process_name] or wezterm.nerdfonts.cod_terminal
end

-- 获取当前目录名
local function get_current_directory(tab)
  local cwd_uri = tab.active_pane.current_working_dir
  if cwd_uri then
    local cwd = cwd_uri.file_path
    if cwd then
      -- 只获取最后一个目录名
      local dir = cwd:match('([^/]+)/?$') or cwd
      return dir
    end
  end
  return nil
end

-- 获取进程名
local function get_process_name(tab)
  local process = tab.active_pane.foreground_process_name
  if process then
    return process:match('([^/]+)$') or process
  end
  return 'shell'
end

-- 格式化 tab 标题
function M.format_tab_title(tab, tabs, panes, config, hover, max_width)
  local process_name = get_process_name(tab)
  local icon = get_process_icon(process_name)
  local dir = get_current_directory(tab)

  -- 构建标题内容
  local title_content
  if dir then
    title_content = string.format('%s %s', icon, dir)
  else
    title_content = string.format('%s %s', icon, process_name)
  end

  -- 如果标题太长，截断它
  if #title_content > max_width - 6 then
    title_content = wezterm.truncate_right(title_content, max_width - 7) .. '…'
  end

  -- Catppuccin Mocha 配色 (使用 'none' 透明背景)
  local colors = {
    bg = 'none',
    fg = '#cdd6f4',
    active_fg = '#cdd6f4',
    inactive_fg = '#6c7086',
    bracket_active = '#89b4fa',
    bracket_inactive = '#585b70',
    separator = '#45475a',
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
    table.insert(elements, { Text = ' ' })
  end

  table.insert(elements, { Foreground = { Color = bracket_color } })
  table.insert(elements, { Text = '[ ' })
  table.insert(elements, { Foreground = { Color = foreground } })
  table.insert(elements, { Attribute = { Intensity = tab.is_active and 'Bold' or 'Normal' } })
  table.insert(elements, { Text = title_content })
  table.insert(elements, { Attribute = { Intensity = 'Normal' } })
  table.insert(elements, { Foreground = { Color = bracket_color } })
  table.insert(elements, { Text = ' ]' })

  -- 添加分隔符（如果不是最后一个 tab）
  if not is_last then
    table.insert(elements, { Foreground = { Color = colors.separator } })
    table.insert(elements, { Text = ' | ' })
  else
    table.insert(elements, { Text = ' ' })
  end

  return elements
end

-- 更新右侧状态栏
function M.update_right_status(window, pane)
  -- Catppuccin Mocha 配色
  local colors = {
    bg = '#1e1e2e',
    fg = '#cdd6f4',
    accent = '#89b4fa',
    surface = '#45475a',
    subtext = '#a6adc8',
  }

  -- 获取当前工作目录
  local cwd = ''
  local cwd_uri = pane:get_current_working_dir()
  if cwd_uri then
    cwd = cwd_uri.file_path or ''
    -- 缩短路径，将 home 目录替换为 ~
    local home = os.getenv('HOME')
    if home then
      cwd = cwd:gsub('^' .. home, '~')
    end
    -- 如果路径太长，只保留后面部分
    if #cwd > 40 then
      cwd = '…' .. cwd:sub(-38)
    end
  end

  -- 获取当前时间
  local time = wezterm.strftime('%H:%M')
  local date = wezterm.strftime('%m/%d %a')

  -- 获取电池状态
  local battery = ''
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
    battery = string.format('%s %.0f%%', icon, charge)
  end

  window:set_right_status(wezterm.format({
    { Foreground = { Color = colors.subtext } },
    { Text = wezterm.nerdfonts.md_folder .. ' ' },
    { Foreground = { Color = colors.fg } },
    { Text = cwd .. '  ' },
    { Foreground = { Color = colors.surface } },
    { Text = '│  ' },
    { Foreground = { Color = colors.subtext } },
    { Text = wezterm.nerdfonts.md_calendar .. ' ' },
    { Foreground = { Color = colors.fg } },
    { Text = date .. '  ' },
    { Foreground = { Color = colors.accent } },
    { Text = wezterm.nerdfonts.md_clock_outline .. ' ' },
    { Foreground = { Color = colors.fg } },
    { Attribute = { Intensity = 'Bold' } },
    { Text = time .. '  ' },
    { Attribute = { Intensity = 'Normal' } },
    { Foreground = { Color = colors.subtext } },
    { Text = battery .. ' ' },
  }))
end

-- 应用配置
function M.apply_to_config(config)
  -- 使用 retro tab bar 以便自定义
  config.use_fancy_tab_bar = false
  config.tab_bar_at_bottom = false
  config.hide_tab_bar_if_only_one_tab = false  -- 保持 tab bar 显示以展示状态栏

  -- Tab bar 颜色配置 (Catppuccin Mocha)
  config.colors = config.colors or {}
  config.colors.tab_bar = {
    background = '#1e1e2e',
    active_tab = {
      bg_color = '#45475a',
      fg_color = '#cdd6f4',
      intensity = 'Bold',
    },
    inactive_tab = {
      bg_color = '#313244',
      fg_color = '#6c7086',
    },
    inactive_tab_hover = {
      bg_color = '#585b70',
      fg_color = '#cdd6f4',
    },
    new_tab = {
      bg_color = '#1e1e2e',
      fg_color = '#6c7086',
    },
    new_tab_hover = {
      bg_color = '#45475a',
      fg_color = '#cdd6f4',
    },
  }

  -- Tab bar 样式
  config.tab_max_width = 32
  config.show_tab_index_in_tab_bar = false
  config.show_new_tab_button_in_tab_bar = true

  -- 窗口边框
  config.window_frame = {
    font = wezterm.font { family = 'Maple Mono Normal NF CN', weight = 'Bold' },
    font_size = 12.0,
    active_titlebar_bg = '#1e1e2e',
    inactive_titlebar_bg = '#1e1e2e',
  }
end

-- 设置事件处理器
function M.setup()
  wezterm.on('format-tab-title', M.format_tab_title)
  wezterm.on('update-right-status', M.update_right_status)
end

return M
