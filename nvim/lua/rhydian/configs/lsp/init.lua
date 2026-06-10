local plugins = require("rhydian.configs.lsp.plugins")
local blinkcmp = require("blink.cmp")
local lsp_defaults = plugins.lspconfig.util.default_config

vim.diagnostic.config({ virtual_text = false })

lsp_defaults.capabilities = blinkcmp.get_lsp_capabilities(lsp_defaults.capabilities)

plugins.null_ls.setup({
    sources = {},
})

plugins.mason.setup()

plugins.mason_null_ls.setup({
    ensure_installed = {},
    automatic_setup = true,
    handlers = {
        function(source_name, methods)
            require("mason-null-ls.automatic_setup")(source_name, methods)
        end,
    },
})

plugins.mason_lspconfig.setup()

require("rhydian.configs.lsp.servers")
