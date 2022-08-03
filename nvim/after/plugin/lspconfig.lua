require("lsp-format").setup {}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local opts = { noremap = true, silent = true }
local border = {
    { '┌', 'FloatBorder' },
    { '─', 'FloatBorder' },
    { '┐', 'FloatBorder' },
    { '│', 'FloatBorder' },
    { '┘', 'FloatBorder' },
    { '─', 'FloatBorder' },
    { '└', 'FloatBorder' },
    { '│', 'FloatBorder' },
}

-- Override popout style globally
vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, optsIn, ...)
    optsIn = optsIn or {}
    optsIn.border = optsIn.border or border
    return orig_util_open_floating_preview(contents, syntax, optsIn, ...)
end

local on_attach_general = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc') -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

    -- highlight word under cursor
    require 'illuminate'.on_attach(client)
end

local on_attach_with_format = function(client, bufnr)
    require "lsp-format".on_attach(client, bufnr)
    on_attach_general(client, bufnr)
end

require('lspconfig').intelephense.setup {
    on_attach = on_attach_general,
    capabilities = capabilities,
}

-- intelephense gives better intellesense, phpactor gives better code actions
require('lspconfig').phpactor.setup {}

require('lspconfig').tsserver.setup {
    on_attach = on_attach_general,
    capabilities = capabilities,
}

require('lspconfig').sumneko_lua.setup {
    on_attach = on_attach_with_format,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT", -- LuaJIT version for neovim
                path = vim.split(package.path, ";"),
            },
            diagnostics = {
                globals = { 'vim' }
            }
        }
    },
}

require('lspconfig').bashls.setup {
    on_attach = on_attach_with_format,
    capabilities = capabilities,
}

require('lspconfig').sqls.setup {
    on_attach = on_attach_general,
    cmd = { "sqls", "-config", "~/.config/sqls/config.yml" },
}

require('lspconfig').eslint.setup {
    on_attach = on_attach_with_format,
    capabilities = capabilities,
    handlers = {
        ['window/showMessageRequest'] = function(_, result, params) return result end
    }
}

require('lspconfig').gopls.setup {
    on_attach = on_attach_with_format,
    capabilities = capabilities,
}

require('lspconfig').rust_analyzer.setup {
    on_attach = on_attach_with_format,
    capabilities = capabilities,
}

require('lspconfig').dockerls.setup {
    on_attach = on_attach_with_format,
    capabilities = capabilities,
}

require("lsp-format").setup {}
