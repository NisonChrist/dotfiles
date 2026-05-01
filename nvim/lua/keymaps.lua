vim.g.mapleader = " "

-- Normal mode
vim.keymap.set("n", "H", "0")
vim.keymap.set("n", "L", "$")

-- Command mode shortcut
vim.keymap.set("n", "<leader>w", ":w<cr>")
vim.keymap.set("n", "<leader>q", ":q<cr>")
vim.keymap.set("n", "<leader>re", ":restart<CR>")

-- Insert mode escape
vim.keymap.set("i", "jk", "<Esc>")

-- Clear search highlight
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Tabs
vim.keymap.set('n', 'tn', ':tabnew<CR>', { desc = 'New tab' })
vim.keymap.set('n', 'tl', ':tabnext<CR>', { desc = 'Next tab' })
vim.keymap.set('n', 'th', ':tabprevious<CR>', { desc = 'Previous tab' })

-- Windows
vim.keymap.set("n", "<leader>v", ":vsplit ")
vim.keymap.set("n", "<leader>s", ":split ")

-- Terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', 'jk', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Pack Manager
vim.keymap.set("n", "<leader>U", ":lua vim.pack.update()")
vim.keymap.set("n", "<leader>D", ":lua vim.pack.del({})")
