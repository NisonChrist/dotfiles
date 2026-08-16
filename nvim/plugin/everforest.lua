vim.pack.add({
	{
		src = "https://github.com/sainnhe/everforest",
		name = "everforest",
	},
})

vim.g.everforest_transparent_background = 1
vim.g.everforest_enable_italic = true

vim.cmd.colorscheme("everforest")
