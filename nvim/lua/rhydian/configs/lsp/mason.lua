local plugins = require("rhydian.configs.lsp.init-plugins")
local mason = plugins.mason
local mason_lspconfig = plugins.mason_lspconfig
local mason_null_ls = plugins.mason_null_ls
local null_ls = plugins.null_ls

mason.setup()

mason_null_ls.setup({
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

            null_ls.register(null_ls.builtins.diagnostics.phpcs.with({
                extra_args = extra_args,
                method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
            }))
        end,
    },
})

mason_lspconfig.setup()
