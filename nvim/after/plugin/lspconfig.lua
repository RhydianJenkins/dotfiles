local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local opts = {noremap = true, silent = true}
local border = {
    {'┌', 'FloatBorder'}, {'─', 'FloatBorder'}, {'┐', 'FloatBorder'},
    {'│', 'FloatBorder'}, {'┘', 'FloatBorder'}, {'─', 'FloatBorder'},
    {'└', 'FloatBorder'}, {'│', 'FloatBorder'}
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

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        -- filter = function(client) return client.name == "null-ls" end,
        bufnr = bufnr
    })
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
    require'illuminate'.on_attach(client)

    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
end

local on_attach_with_format = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function() lsp_formatting(bufnr) end
        })
    end

    return on_attach(client, bufnr)
end

require('lspconfig').intelephense.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').phpactor.setup {}

require('lspconfig').tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT", -- LuaJIT version for neovim
                path = vim.split(package.path, ";")
            },
            diagnostics = {globals = {'vim'}}
        }
    }
}

require('lspconfig').bashls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').sqls.setup {
    on_attach = on_attach,
    cmd = {"sqls", "-config", "~/.config/sqls/config.yml"}
}

require('lspconfig').eslint.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = {
        ['window/showMessageRequest'] = function(_, result, params)
            -- ignore messages, don't @ me
            return result
        end
    }
}

require('lspconfig').gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').dockerls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').eslint.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
