vim.api.nvim_create_autocmd("BufReadPost", {
    desc = "Focus cursor on last position",
    group = vim.api.nvim_create_augroup("FocusCursorGroup", {}),
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight yanked text",
    group = vim.api.nvim_create_augroup("YankHighlight", {}),
    command = "silent! lua vim.highlight.on_yank()",
})

vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Stop trailing whitespace",
    group = vim.api.nvim_create_augroup("StripWhitespaceGroup", {}),
    callback = function()
        vim.cmd("StripWhitespaceOnChangedLines")
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
