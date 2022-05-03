local dap = require('dap')

dap.adapters.php = {
    type = 'executable',
    command = 'node',
    args = { '~/.config/nvim/vim-plugged/vscode-php-debug/src/phpDebug.ts' }
}

dap.configurations.php = {
    {
        type = 'php',
        request = 'launch',
        name = 'Listen for Xdebug',
        port = 9009,
    }
}

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<F4>", "<cmd>lua require('dapui').toggle()<CR>", opts)
vim.api.nvim_set_keymap("n", "<F5>", "<cmd>lua require('dap').toggle_breakpoint()<CR>", opts)
vim.api.nvim_set_keymap("n", "<F9>", "<cmd>lua require('dap').continue()<CR>", opts)

vim.api.nvim_set_keymap("n", "<F1>", "<cmd>lua require('dap').step_over()<CR>", opts)
vim.api.nvim_set_keymap("n", "<F2>", "<cmd>lua require('dap').step_into()<CR>", opts)
vim.api.nvim_set_keymap("n", "<F3>", "<cmd>lua require('dap').step_out()<CR>", opts)

vim.api.nvim_set_keymap("n", "<Leader>dsc", "<cmd>lua require('dap').continue()<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>dsv", "<cmd>lua require('dap').step_over()<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>dsi", "<cmd>lua require('dap').step_into()<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>dso", "<cmd>lua require('dap').step_out()<CR>", opts)

vim.api.nvim_set_keymap("n", "<Leader>dhh", "<cmd>lua require('dap.ui.variables').hover()<CR>", opts)
vim.api.nvim_set_keymap("v", "<Leader>dhv", "<cmd>lua require('dap.ui.variables').visual_hover()<CR>", opts)

vim.api.nvim_set_keymap("n", "<Leader>duh", "<cmd>lua require('dap.ui.widgets').hover()<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>duf", "<cmd>lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>", opts)

vim.api.nvim_set_keymap("n", "<Leader>dro", "<cmd>lua require('dap').repl.open()<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>drl", "<cmd>lua require('dap').repl.run_last()<CR>", opts)

vim.api.nvim_set_keymap("n", "<Leader>dbc", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>dbm", "<cmd>lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') )<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>dbt", "<cmd>lua require('dap').toggle_breakpoint()<CR>", opts)

vim.api.nvim_set_keymap("n", "<Leader>dc", "<cmd>lua require('dap.ui.variables').scopes()<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>di", "<cmd>lua require('dapui').toggle()<CR>", opts)
