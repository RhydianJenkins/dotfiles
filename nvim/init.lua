-- use rg as a grep replacement
if vim.call('executable', 'rg') then
    vim.opt.grepprg = 'rg --vimgrep --no-heading --smart-case'
end

-- Highlight on yank
local yankGrp = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd(
    "TextYankPost",
    {
        command = "silent! lua vim.highlight.on_yank()",
        group = yankGrp,
    }
)

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd(
    "BufReadPost",
    {
        command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]]
    }
)

require('rhydian.keybinds')
require('rhydian.options')
require('rhydian.plugins')
