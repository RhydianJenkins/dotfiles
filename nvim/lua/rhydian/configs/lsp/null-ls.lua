local plugins = require("rhydian.configs.lsp.init-plugins")
local null_ls = plugins.null_ls

null_ls.setup({
    sources = {}, -- sources registered dynamically by mason-null-ls below
})
