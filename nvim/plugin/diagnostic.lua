vim.pack.add({
	{ src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim", name = "tiny-inline-diagnostic" },
})

require("tiny-inline-diagnostic").setup({
	preset = "classic",
  transparent_bg = true,
	options = {
		multilines = {
			enabled = true,
		},
	},
})

vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
