local present, kanagawa = pcall(require, "kanagawa")

if not present then
    print("kanagawa colorscheme plugin not found")
    vim.cmd("colorscheme evening")
    return
end

kanagawa.setup({
    undercurl = true,
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true },
    specialReturn = true,
    specialException = true,
    transparent = false,
    dimInactive = false,
    globalStatus = false,
    terminalColors = true,
    colors = {},
    overrides = function()
        return {}
    end,
    theme = "default",
})

vim.cmd("colorscheme kanagawa")

-- remove background color from certain elements
vim.cmd("hi LineNr guibg=bg")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.opt.fillchars = { eob = " " }
