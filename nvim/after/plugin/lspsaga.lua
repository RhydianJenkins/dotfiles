local present, saga = pcall(require, "lspsaga")

if not present then
    print("lspsaga plugin not found")
    return
end

saga.setup({
    finder = {
        layout = "normal",
    },
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
        title = true,
        border = "rounded",
    },
})

vim.keymap.set("n", "gr", "<cmd>Lspsaga finder<CR>", { desc = "[G]o to [r]eferences" })
vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Next [d]iagnostic" })
vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Previous [d]iagnostic" })
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "[C]ode [a]ction" })
vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "[R]e[n]ame" })
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover doc" })
