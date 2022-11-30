vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("YankHighlight", {}),
    command = "silent! lua vim.highlight.on_yank()",
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup("LspAttachGroup", {}),
    desc = 'LSP actions',
    callback = function()
        local bufmap = function(mode, lhs, rhs)
            vim.keymap.set(mode, lhs, rhs, {buffer = true})
        end

        bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
        bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
        bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
        bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
        bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
    end,
})
