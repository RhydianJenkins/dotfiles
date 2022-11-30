local mason_present, mason = pcall(require, "mason")
local neodev_present, neodev = pcall(require, "neodev")
local lspconfig_present, lspconfig = pcall(require, "lspconfig")
local mason_lspconfig_present, mason_lspconfig = pcall(require, "mason-lspconfig")
local cmp_nvim_lsp_present, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if not mason_present then
    print("mason plugin not found")
    return
end

if not neodev_present then
    print("neodev plugin not found")
    return
end

if not lspconfig_present then
    print("lspconfig plugin not found")
    return
end

if not cmp_nvim_lsp_present then
    print("cmp_nvim_lsp plugin not found")
    return
end

if not mason_lspconfig_present then
    print("mason lspconfig plugin not found")
    return
end

local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lsp_defaults.capabilities,
    cmp_nvim_lsp.default_capabilities()
)

neodev.setup({})

mason.setup({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

mason_lspconfig.setup({
    ensure_installed = {
        'phpactor',
        'intellephense',
        'tsserver',
        'eslint',
        'html',
        'cssls',
    }
})

mason_lspconfig.setup_handlers({
    function(server)
        lspconfig[server].setup({
            capabilities = capabilities,
        })
    end,
})
