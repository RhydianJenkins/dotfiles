local plugins = require("rhydian.configs.lsp.init-plugins")
local lspconfig = plugins.lspconfig
local cmp_nvim_lsp = plugins.cmp_nvim_lsp

vim.diagnostic.config({
    virtual_text = false,
    float = { border = "rounded" },
})

local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend("force", lsp_defaults.capabilities, cmp_nvim_lsp.default_capabilities())
