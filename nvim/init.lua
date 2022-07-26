-- use rg as a grep replacement
if vim.call('executable', 'rg') then
    vim.opt.grepprg = 'rg --vimgrep --no-heading --smart-case'
end

require('rhydian.autocommands')
require('rhydian.keybinds')
require('rhydian.options')
require('rhydian.plugins')
