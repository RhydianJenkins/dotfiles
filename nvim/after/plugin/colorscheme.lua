local present = pcall(require, "kanagawa")

if not present then
    print("kanagawa colorscheme plugin not found")
    vim.cmd("colorscheme evening")
    return
end

vim.cmd("colorscheme kanagawa")

-- remove background color from certain elements
vim.api.nvim_set_hl(0, "LineNr", { bg = "none", fg = "#8f8f8f" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatTitle", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#363646" })
vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = "none" })
vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = "none" })
vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { bg = "none" })
vim.opt.fillchars = { eob = " " }
