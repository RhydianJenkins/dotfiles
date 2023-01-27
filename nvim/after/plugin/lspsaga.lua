local present, saga = pcall(require, "lspsaga")

if not present then
    print("lspsaga plugin not found")
    return
end

saga.setup({
    lightbulb = {
        enable = false,
    },
    code_action = {
        keys = {
            quit = { "q", "<ESC>", "<C-c>" },
            exec = "<CR>",
        },
    },
    preview = {
        lines_above = 10,
        lines_below = 20,
    },
    symbol_in_winbar = {
        enable = false,
    },
    request_timeout = 5000,
    ui = {
        title = true, -- requires nvim 0.9^
        border = "rounded",
    },
})
