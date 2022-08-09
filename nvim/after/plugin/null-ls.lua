local status, null_ls = pcall(require, "null-ls")
if not status then
    print("null-ls plugin not found")
    return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
    sources = {
        formatting.phpcbf,
        formatting.eslint_d,
        formatting.lua_format,
        formatting.stylua.with({ extra_args = { '--indent-type Spaces' } }),
    },
})
