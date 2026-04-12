vim.pack.add({
  { src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim", name = "tiny-inline-diagnostic" }
})

require("tiny-inline-diagnostic").setup()

vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
