vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight yanked text",
    group = vim.api.nvim_create_augroup("YankHighlight", {}),
    command = "silent! lua vim.highlight.on_yank()",
})

vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Js/TS(x) formatting",
    group = vim.api.nvim_create_augroup("LintFormattingGroup", { clear = true }),
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
