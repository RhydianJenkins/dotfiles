local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<leader>m', '<cmd>lua require("harpoon.mark").add_file()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-h>', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
--vim.api.nvim_set_keymap('n', '<C-h>', '<cmd>Telescope harpoon marks<CR>', opts)
