local status, copilot = pcall(require, "copilot")
if not status then
    print("copilot plugin not found")
    return
end

local status_cmp, copilot_cmp = pcall(require, "copilot_cmp")
if not status_cmp then
    print("copilot_cmp plugin not found")
    return
end

copilot.setup({
    cmp = {
        enabled = true,
    },
    ft_disable = { "markdown", "terraform", "help" },
    plugin_manager_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim",
    filetypes = {
        ["*"] = false,
        ["c"] = true,
        ["c#"] = true,
        ["c++"] = true,
        ["go"] = true,
        ["javascript"] = true,
        ["lua"] = true,
        ["nix"] = true,
        ["php"] = true,
        ["python"] = true,
        ["rust"] = true,
        ["typescript"] = true,
    },
})

copilot_cmp.setup()
