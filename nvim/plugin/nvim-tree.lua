vim.pack.add({
	{ src = "https://github.com/nvim-tree/nvim-tree.lua", name = "nvim-tree" },
})

require("nvim-tree").setup()
vim.cmd([[
      :hi      NvimTreeCursorLine guibg=None guifg=#f5c2e7
]])
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>")
