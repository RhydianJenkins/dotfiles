local util = require("lspconfig.util")
local configs = require("lspconfig.configs")

if not configs.symfony_lsp then
    configs.symfony_lsp = {
        default_config = {
            cmd = { "symfony_lsp" },
            filetypes = { "php", "yml", "yaml" },
            root_dir = util.find_git_ancestor,
        },
    }
end

vim.lsp.set_log_level("debug")
