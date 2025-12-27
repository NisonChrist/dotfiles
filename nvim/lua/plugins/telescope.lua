return {
	"nvim-telescope/telescope.nvim",
	tag = "v0.2.0",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
	},
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

		-- telescope-file-browser
		-- vim.keymap.set("n", "<space>ft", ":Telescope file_browser<CR>")

		-- open file_browser with the path of the current buffer
		vim.keymap.set("n", "<space>t", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")

		-- Alternatively, using lua API
		-- vim.keymap.set("n", "<space>ft", function()
		-- 	require("telescope").extensions.file_browser.file_browser()
		-- end)
	end,
}
