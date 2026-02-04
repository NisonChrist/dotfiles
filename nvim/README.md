# Neovim Configuration

A modern, feature-rich Neovim configuration focused on LSP support, elegant UI, and productivity.

## ✨ Features

- **Package Management**: [lazy.nvim](https://github.com/folke/lazy.nvim) for fast plugin loading
- **LSP Support**: Built-in LSP with Lua, TypeScript, Rust, and Typst language servers
- **Autocompletion**: [blink.cmp](https://github.com/saghen/blink.cmp) with snippet support
- **Syntax Highlighting**: Tree-sitter for accurate and fast syntax parsing
- **File Explorer**: nvim-tree for intuitive file navigation
- **Fuzzy Finder**: Telescope with file browser extension
- **Status Line**: lualine for a clean, informative status bar
- **Auto-formatting**: conform.nvim for consistent code formatting
- **Markdown Preview**: markview.nvim for beautiful markdown rendering
- **Typst Preview**: Live preview for Typst documents
- **Theme**: Gruvbox color scheme with multiple alternatives available

## 📦 Plugin List

### Core Functionality
- **lazy.nvim** - Plugin manager
- **mason.nvim** - LSP/DAP/linter installer
- **nvim-treesitter** - Syntax highlighting and code understanding
- **telescope.nvim** - Fuzzy finder and file picker
- **nvim-tree.lua** - File explorer

### Completion & Snippets
- **blink.cmp** - Completion engine (Rust-powered)
- **friendly-snippets** - Collection of common snippets
- **nvim-autopairs** - Auto-close brackets and quotes

### UI & Appearance
- **lualine.nvim** - Status line
- **nvim-web-devicons** - File icons
- **nvim-colorizer.lua** - Color code highlighting
- **gruvbox.nvim** - Color scheme

### Editing & Formatting
- **conform.nvim** - Code formatting
- **tiny-inline-diagnostic.nvim** - Inline diagnostics

### Specialized Tools
- **markview.nvim** - Markdown rendering
- **typst-preview.nvim** - Typst document preview

## ⚙️ Configuration

### Editor Settings
- Line numbers with relative numbering
- 2-space indentation
- System clipboard integration
- Mouse support enabled
- No swap files
- Sign column always visible

### Language Servers
Enabled LSP servers:
- `lua_ls` - Lua
- `ts_ls` - TypeScript/JavaScript
- `rust_analyzer` - Rust
- `tinymist` - Typst

## ⌨️ Key Mappings

### General
- `<leader>w` - Save file
- `<leader>q` - Quit
- `<leader>re` - Restart Neovim
- `jk` - Exit insert mode
- `<Esc>` - Clear search highlight

### Tabs
- `tn` - New tab
- `th` - Next tab
- `tl` - Previous tab

### Windows
- `<leader>v` - Vertical split
- `<leader>s` - Horizontal split

### Terminal
- `<Esc><Esc>` or `jk` - Exit terminal mode

## 🎨 Color Schemes

The configuration includes multiple color scheme options (currently using Gruvbox):
- Gruvbox (active)
- Catppuccin
- Tokyo Night
- Night Owl
- Dracula
- Tailwind Theme

To switch themes, edit `lua/plugins/colorscheme.lua` and change the return statement.

## 📋 Requirements

- Neovim >= 0.9.0
- Git
- A Nerd Font (for icons)
- ripgrep (for Telescope)
- Node.js (for some LSP servers)
- Rust toolchain (for blink.cmp and rust-analyzer)

## 🚀 Installation

1. Backup your existing Neovim configuration:
```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

2. Clone this configuration:
```bash
git clone <your-repo-url> ~/.config/nvim
```

3. Start Neovim:
```bash
nvim
```

Lazy.nvim will automatically install all plugins on first launch.

4. Install language servers via Mason:
```vim
:Mason
```

## 📁 Structure

```
~/.config/nvim/
├── init.lua              # Entry point
├── lazy-lock.json        # Plugin version lock file
├── lua/
│   ├── config/          # Core configuration
│   │   ├── cmd.lua      # Custom commands
│   │   ├── keymap.lua   # Key mappings
│   │   ├── lazy.lua     # Plugin manager setup
│   │   ├── lsp.lua      # LSP configuration
│   │   └── option.lua   # Vim options
│   └── plugins/         # Plugin configurations
│       ├── autopairs.lua
│       ├── blink.lua
│       ├── colorizer.lua
│       ├── colorscheme.lua
│       ├── conform.lua
│       ├── copilot.lua
│       ├── diagnostic.lua
│       ├── icon.lua
│       ├── lualine.lua
│       ├── markview.lua
│       ├── mason.lua
│       ├── nvim-tree.lua
│       ├── telescope.lua
│       ├── treesitter.lua
│       └── typst-preview.lua
└── lsp/                 # Additional LSP configurations
```

## 🤝 Contributing

Feel free to fork and customize this configuration to suit your needs!

## 📝 License

MIT
