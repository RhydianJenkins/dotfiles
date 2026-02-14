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
