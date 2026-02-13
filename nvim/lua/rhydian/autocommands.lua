vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Strip trailing whitespace",
    group = vim.api.nvim_create_augroup("StripWhitespaceGroup", {}),
    callback = function()
        if vim.fn.exists(":StripWhitespaceOnChangedLines") == 2 then
            vim.cmd("StripWhitespaceOnChangedLines")
        end
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "EsLint fix on save",
    group = vim.api.nvim_create_augroup("EsLintFormattingGroup", { clear = true }),
    pattern = {
        "*.js",
        "*.jsx",
        "*.ts",
        "*.tsx",
    },
    callback = function()
        if vim.fn.executable("EslintFixAll") == 1 then
            vim.cmd("EslintFixAll")
        end
    end,
})
