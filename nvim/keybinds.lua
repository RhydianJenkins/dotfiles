local opts = { noremap = true, silent = true }

-- Space <leader> key
vim.g.mapleader = " "

-- CTRL + a to select all
vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', opts)

-- CTRL + s to save
vim.api.nvim_set_keymap('n', '<C-s>', '<cmd>w<CR>', opts)
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc><cmd>w<CR>', opts)

-- CTRL + w to close current buffer
vim.api.nvim_set_keymap('n', '<C-w>', '<cmd>bp<bar>sp<bar>bn<bar>bd<CR>', opts)

-- Tab navigation of buffers
vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>bn<CR>', opts)
vim.api.nvim_set_keymap('n', '<S-tab>', '<cmd>bprevious<CR>', opts)

-- Window navigation
vim.api.nvim_set_keymap('n', '<leader>h', '<C-W><C-h>', opts)
vim.api.nvim_set_keymap('n', '<leader>j', '<C-W><C-j>', opts)
vim.api.nvim_set_keymap('n', '<leader>k', '<C-W><C-k>', opts)
vim.api.nvim_set_keymap('n', '<leader>l', '<C-W><C-l>', opts)
vim.api.nvim_set_keymap('n', '<leader>ws', '<C-W><C-s>', opts)
vim.api.nvim_set_keymap('n', '<leader>wv', '<C-W><C-v>', opts)
vim.api.nvim_set_keymap('n', '<leader>wq', '<C-W><C-q>', opts)
vim.api.nvim_set_keymap('n', '<leader>wo', '<C-W><C-o>', opts)
