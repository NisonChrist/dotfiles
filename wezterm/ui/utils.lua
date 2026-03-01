local wezterm = require("wezterm")

local M = {}

-- Get Process ICON
function M.get_process_icon(process_name)
	local icons = {
		["fish"] = wezterm.nerdfonts.md_fish,
		["zsh"] = wezterm.nerdfonts.dev_terminal,
		["bash"] = wezterm.nerdfonts.cod_terminal_bash,
		["nvim"] = wezterm.nerdfonts.custom_vim,
		["vim"] = wezterm.nerdfonts.custom_vim,
		["node"] = wezterm.nerdfonts.md_nodejs,
		["python"] = wezterm.nerdfonts.dev_python,
		["python3"] = wezterm.nerdfonts.dev_python,
		["ruby"] = wezterm.nerdfonts.dev_ruby,
		["cargo"] = wezterm.nerdfonts.dev_rust,
		["rustc"] = wezterm.nerdfonts.dev_rust,
		["go"] = wezterm.nerdfonts.md_language_go,
		["git"] = wezterm.nerdfonts.dev_git,
		["lazygit"] = wezterm.nerdfonts.dev_git,
		["lua"] = wezterm.nerdfonts.seti_lua,
		["ssh"] = wezterm.nerdfonts.md_ssh,
		["docker"] = wezterm.nerdfonts.dev_docker,
		["htop"] = wezterm.nerdfonts.md_chart_areaspline,
		["btop"] = wezterm.nerdfonts.md_chart_areaspline,
		["top"] = wezterm.nerdfonts.md_chart_areaspline,
		["make"] = wezterm.nerdfonts.seti_makefile,
		["curl"] = wezterm.nerdfonts.md_download,
		["wget"] = wezterm.nerdfonts.md_download,
	}
	return icons[process_name] or wezterm.nerdfonts.cod_terminal
end

-- Get Current Dir
function M.get_current_directory(tab)
	local cwd_uri = tab.active_pane.current_working_dir
	if cwd_uri then
		local cwd = cwd_uri.file_path
		if cwd then
			-- 只获取最后一个目录名
			local dir = cwd:match("([^/]+)/?$") or cwd
			return dir
		end
	end
	return nil
end

-- Get Process Name
function M.get_process_name(tab)
	local process = tab.active_pane.foreground_process_name
	if process then
		return process:match("([^/]+)$") or process
	end
	return "shell"
end

return M
