local present, null_ls = pcall(require, "null-ls")

if not present then
    print("nullls plugin not found")
    return
end

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.codespell,
    },
})
