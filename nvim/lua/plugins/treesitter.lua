return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      'lua',
      'python',
      'rust',
      'javascript',
      'typescript',
      'tsx',
      'html',
      'css',
      'json',
      "fish",
      "gitignore",
      'markdown',
      'markdown_inline',
    }
  }
}
