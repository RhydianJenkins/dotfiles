require("nvim-lsp-installer").setup({
    ensure_installed = { "phpactor", "intelephense", "sumneko_lua", "tsserver", "eslint", "sqls", "jsonls", "gopls", "bashls", "rust_analyzer", "dockerls" },
    automatic_installation = true,
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
