vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require("nvim-treesitter").setup({
  ensure_installed = {
    "lua",
    "python",
    "rust",
    "zig",
    "javascript",
    "typescript",
    "tsx",
    "html",
    "css",
    "json",
    "yaml",
    "fish",
    "gitignore",
    "markdown",
    "markdown_inline",
    "latex",
    "typst",
  },
  sync_install = false,
  auto_install = true,
  -- Indentation based on treesitter for the = operator.
  -- NOTE: This is an experimental feature.
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    -- init_selection: in normal mode, start incremental selection.
    -- node_incremental: in visual mode, increment to the upper named parent.
    -- scope_incremental: in visual mode, increment to the upper scope
    -- node_decremental: in visual mode, decrement to the previous named node.
    keymaps = {
      init_selection = "gss",
      node_incremental = "gsi",
      scope_incremental = "gsc",
      node_decremental = "gsd",
    },
  },
})
