local saga = require 'lspsaga'

saga.init_lsp_saga({
    border_style = "rounded",
    code_action_lightbulb = {
        enable = false,
    },
    code_action_keys = {
        quit = "<C-c>",
        exec = "<CR>",
    },
})
