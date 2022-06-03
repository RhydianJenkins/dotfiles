vim.g.copilot_no_tab_map = true -- don't use tab to accept copilot suggestion
vim.g.copilot_assume_mapped = true
vim.g.copilot_filetypes = {
    ["*"] = false,
    -- ["javascript"] = true,
    -- ["typescript"] = true,
    -- ["lua"] = true,
    -- ["rust"] = true,
    -- ["c"] = true,
    -- ["c#"] = true,
    -- ["c++"] = true,
    -- ["go"] = true,
    -- ["python"] = true,
    -- ["php"] = true,
}
vim.api.nvim_set_keymap("i", "<A-c>", 'copilot#Accept("")', { expr = true, silent = true })
