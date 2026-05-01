local wezterm = require("wezterm")

local M = {}

-- 缓存，避免每次状态栏刷新都执行耗时命令
local cache = {
  cpu = nil,
  gpu = nil,
  last_update = 0,
}

local UPDATE_INTERVAL = 3 -- 每 3 秒刷新一次

-- 执行 shell 命令并返回 stdout（已去除首尾空白）
local function run(cmd)
  local ok, stdout = wezterm.run_child_process({ "bash", "-c", cmd })
  if ok and stdout and stdout ~= "" then
    return (stdout:gsub("^%s*(.-)%s*$", "%1"))
  end
  return nil
end

-- 采集 CPU 使用率（macOS top）
local function fetch_cpu()
  local out = run("top -l 1 -n 0 | grep 'CPU usage'")
  if out then
    -- 形如 "CPU usage: 5.19% user, 7.79% sys, 86.99% idle"
    local idle = out:match("(%d+%.?%d*)%% idle")
    if idle then
      return string.format("%.0f", 100 - tonumber(idle))
    end
  end
  return nil
end

-- 对外接口：返回带缓存的 CPU / GPU 数据（纯数字字符串或 nil）
function M.get_stats()
  local now = os.time()
  if now - cache.last_update >= UPDATE_INTERVAL then
    cache.cpu = fetch_cpu()
    cache.last_update = now
  end
  return {
    cpu = cache.cpu,
  }
end

-- 根据使用率百分比返回颜色
-- < 50%  → green
-- 50-79% → yellow (#f1c21b，IBM Design Language / carbonfox)
-- >= 80% → red
function M.usage_color(pct_str, palette)
  local pct = tonumber(pct_str)
  if not pct then
    return palette.fg3
  end
  if pct >= 80 then
    return palette.red
  elseif pct >= 50 then
    return "#f1c21b"
  else
    return palette.green
  end
end

return M
