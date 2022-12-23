local present, colorscheme = pcall(require, "base16-colorscheme")

if not present then
    print("base16 colorscheme plugin not found")
    return
end

colorscheme.with_config({
    telescope = false,
    indentblankline = false,
    notify = false,
    ts_rainbow = false,
    cmp = false,
    illuminate = false,
    lsp_semantic = false,
})

vim.cmd("colorscheme base16-gruvbox-dark-hard")
