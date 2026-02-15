local plugins = require("rhydian.configs.lsp.init-plugins")
local lspconfig = plugins.lspconfig
local cmp_nvim_lsp = plugins.cmp_nvim_lsp

vim.diagnostic.config({
    virtual_text = false,
    float = { border = "rounded" },
})

local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend("force", lsp_defaults.capabilities, cmp_nvim_lsp.default_capabilities())

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        vim.api.nvim_buf_create_user_command(args.buf, "Format", function()
            vim.lsp.buf.format({ async = false })
        end, { desc = "LSP: Format current buffer" })
    end,
})
