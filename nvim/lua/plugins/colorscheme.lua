local catppuccin = {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "auto", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = "latte",
				dark = "mocha",
			},
			transparent_background = true, -- disables setting the background color.
			float = {
				transparent = false, -- enable transparent floating windows
				solid = false, -- use solid styling for floating windows, see |winborder|
			},
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = false, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
			no_italic = false, -- Force no italic
			no_bold = false, -- Force no bold
			no_underline = false, -- Force no underline
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
				-- miscs = {}, -- Uncomment to turn off hard-coded styles
			},
			lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
					ok = { "italic" },
				},
				underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
					ok = { "underline" },
				},
				inlay_hints = {
					background = true,
				},
			},
			color_overrides = {},
			custom_highlights = {},
			default_integrations = true,
			auto_integrations = true,
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				notify = false,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
				-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
			},
		})

		-- setup must be called before loading
		vim.cmd.colorscheme("catppuccin")
	end,
}

local night_owl = {
	"oxfist/night-owl.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("night-owl").setup({
			bold = true,
			italics = true,
			underline = true,
			undercurl = true,
			transparent_background = true,
		})
		vim.cmd.colorscheme("night-owl")
	end,
}

local dracula = {
	"Mofiqul/dracula.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		local dracula = require("dracula")
		dracula.setup({
			-- customize dracula color palette
			-- colors = {
			--   bg = "#282A36",
			--   fg = "#F8F8F2",
			--   selection = "#44475A",
			--   comment = "#6272A4",
			--   red = "#FF5555",
			--   orange = "#FFB86C",
			--   yellow = "#F1FA8C",
			--   green = "#50fa7b",
			--   purple = "#BD93F9",
			--   cyan = "#8BE9FD",
			--   pink = "#FF79C6",
			--   bright_red = "#FF6E6E",
			--   bright_green = "#69FF94",
			--   bright_yellow = "#FFFFA5",
			--   bright_blue = "#D6ACFF",
			--   bright_magenta = "#FF92DF",
			--   bright_cyan = "#A4FFFF",
			--   bright_white = "#FFFFFF",
			--   menu = "#21222C",
			--   visual = "#3E4452",
			--   gutter_fg = "#4B5263",
			--   nontext = "#3B4048",
			--   white = "#ABB2BF",
			--   black = "#191A21",
			-- },
			-- show the '~' characters after the end of buffers
			show_end_of_buffer = true, -- default false
			-- use transparent background
			transparent_bg = true, -- default false
			-- set custom lualine background color
			-- lualine_bg_color = "#44475a", -- default nil
			-- set italic comment
			italic_comment = true, -- default false
			-- overrides the default highlights with table see `:h synIDattr`
			overrides = {},
			-- You can use overrides as table like this
			-- overrides = {
			--   NonText = { fg = "white" }, -- set NonText fg to white
			--   NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
			--   Nothing = {} -- clear highlight of Nothing
			-- },
			-- Or you can also use it like a function to get color from theme
			-- overrides = function (colors)
			--   return {
			--     NonText = { fg = colors.white }, -- set NonText fg to white of theme
			--   }
			-- end,
		})
		-- load the colorscheme here
		vim.cmd([[colorscheme dracula]])
	end,
}

local gruvbox = {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		-- Default options:
		require("gruvbox").setup({
			terminal_colors = true, -- add neovim terminal colors
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = true,
				emphasis = true,
				comments = true,
				operators = false,
				folds = true,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "", -- can be "hard", "soft" or empty string
			palette_overrides = {},
			overrides = {},
			dim_inactive = false,
			transparent_mode = true,
		})
		vim.cmd([[colorscheme gruvbox]])
	end,
}

local tailwind = {
	"NisonChrist/tailwind-theme.nvim",
	branch = "dev",
	lazy = false,
	priority = 1000,
	config = function()
		require("tailwind-theme").setup({
			transparent = true,
		})
		vim.cmd("colorscheme tailwind-theme")
	end,
}

return catppuccin
