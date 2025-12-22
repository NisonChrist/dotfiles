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
vim.keymap.set('n', 'th', ':tabnext<CR>', { desc = 'Previous tab' })
vim.keymap.set('n', 'tl', ':tabprevious<CR>', { desc = 'Next tab' })

-- Windows
vim.keymap.set("n", "<leader>v", ":vsplit ")
vim.keymap.set("n", "<leader>s", ":split ")

-- Terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', 'jk', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

