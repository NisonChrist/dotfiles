local M = {}

M.use_keymap = function(plugin_api)
	local keymap = vim.keymap
	return plugin_api, keymap
end

return M
