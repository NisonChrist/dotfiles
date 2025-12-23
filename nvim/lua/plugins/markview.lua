return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	-- Completion for `blink.cmp`
	dependencies = { "saghen/blink.cmp" },
	config = function()
		-- Disable automatic previews.
		require("markview").setup({
			preview = { enable = false },
		})

		vim.keymap.set(
			"n",
			"<leader>m",
			"<CMD>Markview<CR>",
			{ desc = "Toggles `markview` previews globally." }
		)
	end,
}
