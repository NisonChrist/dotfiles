return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufWritePre", "BufReadPost" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff" },
			typst = { "typstyle" },
		},
		formatters = {
			ruff = {
				command = "ruff",
				args = { "format", "--stdin-filename", "$FILENAME" },
			},
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
	},
	init = function()
		vim.keymap.set("", "<leader>c", function()
			require("conform").format({ async = true }, function(err)
				if not err then
					local mode = vim.api.nvim_get_mode().mode
					if vim.startswith(string.lower(mode), "v") then
						vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
					end
				end
			end)
		end, { desc = "Format code" })
	end,
}
