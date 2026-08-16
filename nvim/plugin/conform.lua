vim.pack.add({
  { src = "https://github.com/stevearc/conform.nvim", name = "conform" },
})

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff" },
    typescript = {"oxfmt"},
    typst = { "typstyle" },
    rust = { "rust-analyzer" },
    zig = { "zls" },
    json = { "oxfmt" }
  },
  formatters = {
    ruff = {
      command = "ruff",
      args = { "format", "--stdin-filename", "$FILENAME" },
    },
    oxfmt = {
      command = "oxfmt",
    }
  },
  default_format_opts = {
    lsp_format = "fallback",
  },
})

vim.keymap.set("", "<leader>c", function()
  require("conform").format({ async = true }, function(err)
    if not err then
      local mode = vim.api.nvim_get_mode().mode
      if vim.startswith(string.lower(mode), "v") then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
      end
    end
  end)
end, { desc = "Format Code" })
