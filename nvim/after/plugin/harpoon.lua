local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<leader>m", '<cmd>lua require("harpoon.mark").add_file()<CR>', opts)
vim.api.nvim_set_keymap("n", "<C-h>", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
vim.api.nvim_set_keymap("n", "<leader>tc", '<cmd>lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>', opts)

vim.api.nvim_set_keymap("n", "<leader>1", '<cmd>lua require("harpoon.ui").nav_file(1)<CR>', opts)
vim.api.nvim_set_keymap("n", "<leader>2", '<cmd>lua require("harpoon.ui").nav_file(2)<CR>', opts)
vim.api.nvim_set_keymap("n", "<leader>3", '<cmd>lua require("harpoon.ui").nav_file(3)<CR>', opts)
vim.api.nvim_set_keymap("n", "<leader>4", '<cmd>lua require("harpoon.ui").nav_file(4)<CR>', opts)
vim.api.nvim_set_keymap("n", "<leader>5", '<cmd>lua require("harpoon.ui").nav_file(5)<CR>', opts)

require("harpoon").setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 5,
        height = 20,
    },
})
