local M = {}

local function require_all(dir, prefix)
	local lfs = require("lfs")
	prefix = prefix or dir:gsub("/", ".")
	for file in lfs.dir(dir) do
		if file:match("%.lua$") and file ~= "init.lua" then
			local mod = file:gsub("%.lua$", "")
			require(prefix .. "." .. mod)
		end
	end
end

M.load_plugins = function()
	require_all("plugins")
end

return M
