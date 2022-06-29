local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<leader>tn', '<cmd>lua require("neotest").run.run()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>tf', '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>to', '<cmd>lua require("neotest").output.open({ enter = true })<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>tl', '<cmd>lua require("neotest").neotest.run.run_last()<CR>', opts)
vim.api.nvim_set_keymap('n', '[t', '<cmd>lua require("neotest").jump.prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']t', '<cmd>lua require("neotest").jump.next()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<leader>ts', '<cmd>TestSuit<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<leader>tv', '<cmd>TestVisit<CR>', opts)

vim.g['test#strategy'] = 'neovim'

require("neotest").setup({
    adapters = {
        require("neotest-plenary"),
        require('neotest-jest')({
            jestCommand = "npm run test:unit --"
        }),
        require("neotest-vim-test")({
            ignore_file_types = { "js", "ts" },
        }),
    },
    icons = {
        running = "↻",
    },
    strategies = {
        integrated = {
            width = 180
        },
    },
})
