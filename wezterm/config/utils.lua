local wezterm = require("wezterm")

local M = {}

--- Check if the command exists on Windows
---@param cmd string Command name
---@return boolean
function M.windows_command_exists(cmd)
    local success, stdout = wezterm.run_child_process({ "where", cmd })
    return success and stdout and stdout ~= ""
end

--- Check if the command exists on Unix
---@param cmd string Command name
---@return boolean
function M.unix_command_exists(cmd)
    local success, stdout = wezterm.run_child_process({ "sh", "-c", "command -v " .. cmd })
    return success and stdout and stdout ~= ""
end

--- Check if the current system is Windows
---@return boolean
function M.is_windows()
    return wezterm.target_triple:find("windows") ~= nil
end

return M
