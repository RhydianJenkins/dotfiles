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
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Strip trailing whitespace",
    group = vim.api.nvim_create_augroup("StripWhitespaceGroup", {}),
    callback = function()
        if vim.fn.exists(":StripWhitespaceOnChangedLines") == 2 then
            vim.cmd("StripWhitespaceOnChangedLines")
        end
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "twig" },
    callback = function()
        vim.treesitter.start()
    end,
})
