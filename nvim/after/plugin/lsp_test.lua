local util = require("lspconfig.util")
local configs = require("lspconfig.configs")

if not configs.symfony_ls then
    configs.symfony_ls = {
        default_config = {
            cmd = { "symfony_ls" },
            filetypes = { "lua", "php", "yml", "yaml" },
            root_dir = util.find_git_ancestor,
        },
    }
end

vim.lsp.set_log_level("debug")
