vim.g.mapleader = " "

-- Normal mode
vim.keymap.set("n", "H", "0", { desc = "Jump to line start" })
vim.keymap.set("n", "L", "$", { desc = "Jump to line end" })

-- Command mode shortcut
vim.keymap.set("n", "<leader>w", ":w<cr>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<cr>", { desc = "Quit" })
vim.keymap.set("n", "<leader>re", ":restart<CR>", { desc = "Restart Neovim" })

-- Insert mode escape
vim.keymap.set("i", "jk", "<Esc>", { desc = "Escape insert mode" })

-- Clear search highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Tabs
vim.keymap.set("n", "tn", ":tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "tl", ":tabnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "th", ":tabprevious<CR>", { desc = "Previous tab" })

-- Windows
vim.keymap.set("n", "<leader>v", ":vsplit ", { desc = "Vertical split" })
vim.keymap.set("n", "<leader>s", ":split ", { desc = "Horizontal split" })

-- Terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("t", "jk", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Pack Manager
vim.keymap.set("n", "<leader>U", ":lua vim.pack.update()<CR>", { desc = "Update plugins" })
vim.keymap.set("n", "<leader>D", ":lua vim.pack.del({})", { desc = "Delete plugin" })
