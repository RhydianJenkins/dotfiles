local present, saga = pcall(require, "lspsaga")

if not present then
    print("lspsaga plugin not found")
    return
end

saga.init_lsp_saga({
    border_style = "rounded",
    preview_lines_above = 5,
    finder_request_timeout = 3000,
    code_action_lightbulb = {
        enable = false,
    },
    code_action_keys = {
        quit = "<C-c>",
        exec = "<CR>",
    },
    finder_action_keys = {
        quit = { "q", "<ESC>", "<C-c>" },
        vsplit = "v",
        split = "s",
    },
})
