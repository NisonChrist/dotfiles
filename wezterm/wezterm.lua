local wezterm = require("wezterm")

local config = wezterm.config_builder()

local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
bar.apply_to_config(config, {
	modules = {
		username = {
			enabled = false,
		},
		hostname = {
			enabled = false,
		},
	},
})

local modules = {
    "config.fonts",
    "config.appearance",
    -- "config.window",
    -- "config.tab_bar",
    -- "config.cursor",
    "config.shell",
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
