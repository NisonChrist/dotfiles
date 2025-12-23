return {
	"zbirenbaum/copilot.lua",
	dependencies = {
		"copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
	},
	cmd = "Copilot",
	event = "InsertEnter",
	opts = {
		filetypes = {
			javascript = true, -- allow specific filetype
			typescript = true, -- allow specific filetype
			markdown = true,
			python = true,
			typst = true,
			["*"] = false,-- disable for all other filetypes and ignore default `filetypes`
		},
	},
	config = function()
		require("copilot").setup({})
	end,
}
