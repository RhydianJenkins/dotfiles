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

-- Shift + Y to yank to the end of the line
vim.api.nvim_set_keymap('n', 'S-Y', 'y$', opts)

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
vim.api.nvim_set_keymap('n', '<leader>wr', '<C-W><C-r>', opts)

-- Find dot files
vim.api.nvim_set_keymap('n', '<leader>dot', "<cmd>lua require('telescope.builtin').find_files{ cwd = '~/dotfiles', prompt_title = '~ Dotfiles ~'}<CR>", opts)

-- Resource vim config
vim.api.nvim_set_keymap('n', '<Leader>src', '<cmd>source $MYVIMRC<cr>', opts)

-- Resize window
vim.api.nvim_set_keymap('n', '<leader>=', '<cmd>vertical resize +5<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>-', '<cmd>vertical resize -5<CR>', opts)

-- Replace line above/below
vim.api.nvim_set_keymap('n', '<A-j>', '<cmd>move +1<CR>==', opts)
vim.api.nvim_set_keymap('n', '<A-k>', '<cmd>move -2<CR>==', opts)

-- Diagnostics
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- LSP
vim.api.nvim_set_keymap('n', '<leader>a', '<cmd>Lspsaga code_action<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opts)
vim.api.nvim_set_keymap('n', 'K', '<cmd>Lspsaga preview_definition<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>Lspsaga hover_doc<CR>', opts)
