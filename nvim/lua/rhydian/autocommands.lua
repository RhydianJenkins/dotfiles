vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight yanked text",
    group = vim.api.nvim_create_augroup("YankHighlight", {}),
    command = "silent! lua vim.highlight.on_yank()",
})

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    group = vim.api.nvim_create_augroup("LspAttachGroup", {}),
    callback = function()
        local bufmap = function(mode, lhs, rhs)
            vim.keymap.set(mode, lhs, rhs, { buffer = true })
        end

        bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
        bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
        bufmap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "ESLint formatting for ts/js(x) files",
    group = vim.api.nvim_create_augroup("LintFormattingGroup", {}),
    pattern = {
        "*.js",
        "*.tsx",
        "*.ts",
        "*.tsx",
    },
    callback = function()
        vim.cmd("EslintFixAll")
    end,
})
