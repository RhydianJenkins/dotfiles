local present, saga = pcall(require, "lspsaga")

if not present then
    print("saga plugin not found")
    return
end

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
