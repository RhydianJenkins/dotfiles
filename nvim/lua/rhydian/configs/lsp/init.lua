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
    ensure_installed = {
        "phpcs",
    },
    automatic_setup = true,
    handlers = {
        function(source_name, methods)
            require("mason-null-ls.automatic_setup")(source_name, methods)
        end,
        phpcs = function(_, _)
            local ruleset_exists = vim.fn.filereadable("tests/phpcs-ruleset.xml") == 1
            local extra_args = ruleset_exists and { "--standard=tests/phpcs-ruleset.xml" } or { "--standard=PSR12" }

            plugins.null_ls.register(plugins.null_ls.builtins.diagnostics.phpcs.with({
                extra_args = extra_args,
                method = plugins.null_ls.methods.DIAGNOSTICS_ON_SAVE,
            }))
        end,
    },
})

plugins.mason_lspconfig.setup()

require("rhydian.configs.lsp.servers")
