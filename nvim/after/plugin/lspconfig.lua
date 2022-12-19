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
local format_au_group = vim.api.nvim_create_augroup("LspFormatting", {})

lsp_defaults.capabilities = vim.tbl_deep_extend("force", lsp_defaults.capabilities, cmp_nvim_lsp.default_capabilities())

neodev.setup()

mason.setup()

mason_lspconfig.setup({
    ensure_installed = {
        "intelephense",
        "phpactor",
        "tsserver",
        "dockerls",
        "eslint",
        "html",
        "cssls",
        "sqls",
        "bashls",
        "rust_analyzer",
        "sumneko_lua",
    },
})

local function on_attach(client, bufnr)
    require("illuminate").on_attach(client, bufnr)

    local nmap = function(keys, func, desc)
        if desc then
            desc = "LSP: " .. desc
        end

        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
    end

    nmap("<leader>a", "<cmd>Lspsaga code_action<CR>", "Code [a]ction")
    nmap("<leader>rn", "<cmd>Lspsaga rename<CR>", "[R]e[n]ame")
    nmap("K", "<cmd>Lspsaga peek_definition<CR>", "Pee[k] definition")
    nmap("<C-k>", "<cmd>Lspsaga hover_doc<CR>", "Hover doc")
    nmap("gd", vim.lsp.buf.definition, "[G]o to [d]efinition")
    nmap("gi", vim.lsp.buf.implementation, "[G]o to [i]mplementation")
    nmap("gt", vim.lsp.buf.type_definition, "[G]o to [t]ype definition")

    vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
        if vim.lsp.buf.format then
            vim.lsp.buf.format({ async = false })
        end
    end, { desc = "Format current buffer with LSP" })
end

local function on_attach_with_format(client, bufnr)
    vim.api.nvim_clear_autocmds({ group = format_au_group, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = format_au_group,
        buffer = bufnr,
        callback = function()
            if vim.lsp.buf.format then
                vim.lsp.buf.format({ async = false })
            end
        end,
    })

    return on_attach(client, bufnr)
end

mason_lspconfig.setup_handlers({
    function(server)
        lspconfig[server].setup({
            on_attach = on_attach,
        })
    end,
    ["sumneko_lua"] = function()
        lspconfig.sumneko_lua.setup({
            on_attach = on_attach_with_format,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        })
    end,
    ["rust_analyzer"] = function()
        lspconfig.rust_analyzer.setup({
            on_attach = on_attach_with_format,
        })
    end,
})
