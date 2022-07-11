local opts = { noremap = true, silent = true }

vim.g["test#javascript#runner"] = "jest"
vim.g["test#typescript#runner"] = "jest"
vim.g["test#strategy"] = "neovim"
vim.g["test#javascript#jest#options"] = {
    all = "--silent",
}

vim.api.nvim_set_keymap('n', '<leader>tf', '<cmd>TestFile<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>tn', '<cmd>lua require("neotest").run.run()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>to', '<cmd>lua require("neotest").output.open({ enter = true })<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>tl', '<cmd>lua require("neotest").neotest.run.run_last()<CR>', opts)
vim.api.nvim_set_keymap('n', '[t', '<cmd>lua require("neotest").jump.prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']t', '<cmd>lua require("neotest").jump.next()<CR>', opts)

vim.g['test#strategy'] = 'neovim'

require("neotest").setup({
    adapters = {
        require("neotest-vim-test")({
            ignore_file_types = { "js", "jsx" },
        }),
        require("neotest-plenary"),
        require('neotest-jest')({
            jestCommand = "npm test --",
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
