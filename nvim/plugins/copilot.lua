local opts = { noremap = true, silent = true }

vim.g.copilot_no_tab_map = true -- don't use tab to accept copilot suggestion
vim.g.copilot_assume_mapped = true
vim.g.copilot_filetypes = {
    ["*"] = false,
    ["javascript"] = true,
    ["typescript"] = true,
    ["php"] = true,
    -- ["lua"] = true,
    -- ["rust"] = true,
    -- ["c"] = true,
    -- ["c#"] = true,
    -- ["c++"] = true,
    -- ["go"] = true,
    -- ["python"] = true,
}
vim.api.nvim_set_keymap("i", "<A-c>", 'copilot#Accept("")', { expr = true, silent = true })

-- Copilot
vim.api.nvim_set_keymap('n', '<leader>cpe', '<cmd>Copilot enable<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>cpd', '<cmd>Copilot disable<CR>', opts)
