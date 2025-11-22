local mason_present, mason = pcall(require, "mason")
local lspconfig_present, lspconfig = pcall(require, "lspconfig")
local mason_lspconfig_present, mason_lspconfig = pcall(require, "mason-lspconfig")
local cmp_nvim_lsp_present, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local null_ls_present, null_ls = pcall(require, "null-ls")
local mason_null_ls_present, mason_null_ls = pcall(require, "mason-null-ls")

if not mason_present then
    print("mason plugin not found")
    return
end

if not null_ls_present then
    print("null ls plugin not found")
    return
end

if not mason_null_ls_present then
    print("mason null ls plugin not found")
    return
end

if not lspconfig_present then
    print("lspconfig plugin not found")
    return
end

if not mason_lspconfig_present then
    print("mason lspconfig plugin not found")
    return
end

if not cmp_nvim_lsp_present then
    print("cmp_nvim_lsp plugin not found")
    return
end

local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend("force", lsp_defaults.capabilities, cmp_nvim_lsp.default_capabilities())

---@param bufnr number
local function on_attach(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = "LSP: " .. desc
        end

        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
    end

    nmap("gd", vim.lsp.buf.definition, "[G]o to [d]efinition")
    nmap("gi", vim.lsp.buf.implementation, "[G]o to [i]mplementation")
    nmap("gt", vim.lsp.buf.type_definition, "[G]o to [t]ype definition")

    if vim.lsp.buf.format then
        vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
            vim.lsp.buf.format({ async = false })
        end, { desc = "LSP: Format current buffer" })
    end
end

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        on_attach(args.data.client_id, args.buf)
    end,
})

if vim.lsp and vim.lsp.config then
    vim.lsp.config("sqlls", {
        filetypes = { "sql", "mysql" },
        cmd = { "sql-language-server", "up", "--method", "stdio" },
        root_dir = function(fname)
            return lspconfig.util.root_pattern("package.json", ".git")(fname) or lspconfig.util.path.dirname(fname)
        end,
        handlers = {
            ["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics,
                { virtual_text = false }
            ),
        },
    })

    vim.lsp.config("intelephense", {
        settings = {
            intelephense = {
                stubs = {
                    "bcmath",
                    "bz2",
                    "Core",
                    "curl",
                    "date",
                    "dom",
                    "fileinfo",
                    "filter",
                    "gd",
                    "gettext",
                    "hash",
                    "iconv",
                    "imap",
                    "intl",
                    "json",
                    "libxml",
                    "mbstring",
                    "mcrypt",
                    "mysql",
                    "mysqli",
                    "password",
                    "pcntl",
                    "pcre",
                    "PDO",
                    "pdo_mysql",
                    "Phar",
                    "readline",
                    "regex",
                    "session",
                    "SimpleXML",
                    "sockets",
                    "sodium",
                    "standard",
                    "superglobals",
                    "tokenizer",
                    "xml",
                    "xdebug",
                    "xmlreader",
                    "xmlwriter",
                    "yaml",
                    "zip",
                    "zlib",
                    "wordpress-stubs",
                    "woocommerce-stubs",
                    "acf-pro-stubs",
                    "wordpress-globals",
                    "wp-cli-stubs",
                    "genesis-stubs",
                    "polylang-stubs",
                    "redis",
                },
            },
        },
    })
end

null_ls.setup({
    sources = {
        -- anything not supported by mason
    },
})

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
