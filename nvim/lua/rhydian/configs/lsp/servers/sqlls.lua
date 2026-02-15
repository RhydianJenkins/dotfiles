local plugins = require("rhydian.configs.lsp.init-plugins")
local lspconfig = plugins.lspconfig

if vim.lsp and vim.lsp.config then
    vim.lsp.config("sqlls", {
        filetypes = { "sql", "mysql" },
        cmd = { "sql-language-server", "up", "--method", "stdio" },
        root_dir = function(fname)
            return lspconfig.util.root_pattern("package.json", ".git")(fname) or lspconfig.util.path.dirname(fname)
        end,
    })
end
