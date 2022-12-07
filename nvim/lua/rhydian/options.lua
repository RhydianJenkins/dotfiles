vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.errorbells = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.cmdheight = 1
vim.opt.updatetime = 50
vim.opt.shortmess:append("c")
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.laststatus = 3
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = true

-- use rg as a grep replacement
if vim.call("executable", "rg") then
    vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
end
