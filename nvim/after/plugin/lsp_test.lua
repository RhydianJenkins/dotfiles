local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")

if not configs.lsp_test then
    configs.lsp_test = {
        default_config = {
            cmd = { "lsp_test", "--stdio" },
            cmd_cwd = "/home/rhydian/projects/lsp_test/target/release",
            filetypes = { "lua" },
        },
    }
end
