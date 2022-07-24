-- Highlight on yank
vim.api.nvim_create_autocmd(
    "TextYankPost",
    {
    command = "silent! lua vim.highlight.on_yank()",
    group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
}
)

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd(
    "BufReadPost",
    {
    command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]],
    group = vim.api.nvim_create_augroup("GotoLast", { clear = true }),
}
)
