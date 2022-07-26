local status, copilot = pcall(require, "copilot")
if (not status) then
    print('copilot plugin not found')
    return
end

copilot.setup {
    cmp = {
        enabled = true,
    },
    panel = {
        enabled = true,
    },
    ft_disable = { "markdown", "terraform", "help" },
    plugin_manager_path = vim.env.HOME .. "/.config/nvim/vim-plugged"
}

vim.g.copilot_filetypes = {
    ["*"] = false,
    ["javascript"] = true,
    ["typescript"] = true,
    ["php"] = true,
    ["lua"] = true,
    ["rust"] = true,
    ["c"] = true,
    ["c#"] = true,
    ["c++"] = true,
    ["go"] = true,
    ["python"] = true,
}
