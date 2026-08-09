local wezterm = require("wezterm")
local config = wezterm.config_builder()

local plugins = {
	"plugins.bar",
}

for _, name in ipairs(plugins) do
	local plugin = require(name).plugin
  local plugin_config = require(name).config
	plugin.apply_to_config(config, plugin_config)
end

local modules = {
	"config.font",
	"config.appearance",
	"config.shell",
	-- "config.window",
	-- "config.tab_bar",
	-- "config.cursor",
	-- "config.ssh_domains",
	-- "config.launch_menu",
	-- "config.events",
	-- "config.keybindings",
	-- "config.mouse",
	-- "config.advanced",
	-- "config.hyperlink",
}

for _, name in ipairs(modules) do
	local module = require(name)
	if module and module.apply then
		module.apply(config)
	end
end

return config
