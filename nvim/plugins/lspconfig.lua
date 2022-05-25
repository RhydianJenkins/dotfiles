local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

local on_attach_general = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc') -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

    -- highlight word under cursor
    require 'illuminate'.on_attach(client)
end

local on_attach_with_format = function(client, bufnr)
    require "lsp-format".on_attach(client, bufnr)
    on_attach_general(client, bufnr)
end

require('lspconfig').phpactor.setup {
    on_attach = on_attach_general,
    capabilities = capabilities
}

require('lspconfig').intelephense.setup {
    on_attach = on_attach_general,
    capabilities = capabilities
}

require('lspconfig').tsserver.setup {
    on_attach = on_attach_general,
    capabilities = capabilities
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
    capabilities = capabilities
}

require('lspconfig').sqls.setup {
    on_attach = on_attach_general,
    cmd = { "sqls", "-config", "~/.config/sqls/config.yml" }
}

require('lspconfig').eslint.setup {
    on_attach = on_attach_with_format,
    capabilities = capabilities,
    handlers = {
        -- Don't shout at me when there's an eslint error
        ---@diagnostic disable-next-line: unused-local
        ['window/showMessageRequest'] = function(_, result, params) return result end
    }
}

require('lspconfig').gopls.setup {
    on_attach = on_attach_with_format,
    capabilities = capabilities
}

require('lspconfig').rust_analyzer.setup {
    on_attach = on_attach_with_format,
    capabilities = capabilities
}

require('lspconfig').dockerls.setup {
    on_attach = on_attach_with_format,
    capabilities = capabilities
}

require("lsp-format").setup {}
