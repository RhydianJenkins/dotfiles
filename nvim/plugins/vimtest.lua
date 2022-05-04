local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<leader>tn', '<cmd>TestNearest<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>tf', '<cmd>TestFile<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>ts', '<cmd>TestSuit<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>tl', '<cmd>TestLast<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>tv', '<cmd>TestVisit<CR>', opts)
