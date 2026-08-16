vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/OXY2DEV/markview.nvim", name = "markview" },
})

require("markview").setup({
	preview = { enable = true, latex = true },
	latex = {
		enable = true,
	},
})

vim.keymap.set("n", "<leader>m", "<CMD>Markview<CR>", { desc = "Toggles `markview` previews globally." })
