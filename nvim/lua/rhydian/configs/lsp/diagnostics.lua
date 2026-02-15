local plugins = require("rhydian.configs.lsp.plugins")
local lsp_defaults = plugins.lspconfig.util.default_config

vim.diagnostic.config({
    virtual_text = false,
    float = { border = "rounded" },
})

lsp_defaults.capabilities = require("blink.cmp").get_lsp_capabilities(lsp_defaults.capabilities)
