local M = {}

function M.apply(config)
	-- Spawn a fish shell in login mode
	config.default_prog = { "/usr/local/bin/fish", "-l" }
	-- local utils = require("config.utils")
	-- if utils.is_windows() then
	-- 	config.default_prog = { "pwsh", "--NoLogo" }
	-- else
	-- 	-- Unix: fish -> zsh →  bash
	-- 	if utils.unix_command_exists("fish") then
	-- 		config.default_prog = { "/usr/local/bin/fish", "-l" }
	-- 	elseif utils.unix_command_exists("zsh") then
	-- 		config.default_prog = { "zsh", "-i" }
	-- 	else
	-- 		config.default_prog = { "bash", "-i" }
	-- 	end
	-- end
end

return M
