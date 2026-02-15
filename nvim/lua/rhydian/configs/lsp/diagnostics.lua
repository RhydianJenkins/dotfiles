local plugins = require("rhydian.configs.lsp.plugins")
local cmp_nvim_lsp = plugins.cmp_nvim_lsp
local lsp_defaults = plugins.lspconfig.util.default_config

vim.diagnostic.config({
    virtual_text = false,
    float = { border = "rounded" },
})

lsp_defaults.capabilities = vim.tbl_deep_extend("force", lsp_defaults.capabilities, cmp_nvim_lsp.default_capabilities())
