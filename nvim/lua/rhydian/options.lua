vim.g.mapleader = " "

vim.o.nu = true
vim.o.relativenumber = true
vim.o.errorbells = false
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.termguicolors = true
vim.o.scrolloff = 8
vim.o.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.o.cmdheight = 1
vim.o.updatetime = 50
vim.opt.shortmess:append("c")
vim.o.mouse = "a"
vim.o.mousemoveevent = true
vim.o.clipboard = "unnamed,unnamedplus"
vim.o.laststatus = 3
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.cursorline = true
vim.o.completeopt = "menuone,noselect"
vim.o.updatetime = 100
vim.o.cmdheight = 0

-- use rg as a grep replacement
if vim.fn.executable("rg") == 1 then
    vim.o.grepprg = "rg --smart-case --vimgrep"
end
