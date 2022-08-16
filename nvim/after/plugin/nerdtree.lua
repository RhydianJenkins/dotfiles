-- TODO convert function to LUA
vim.cmd([[
    function! NERDTreeToggleInCurDir()
        if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
            exe ":NERDTreeClose"
        else
            if (expand("%:t") != '')
                exe ":NERDTreeFind"
            else
                exe ":NERDTreeToggle"
            endif
        endif
    endfunction
]])

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<C-b>', '<cmd>call NERDTreeToggleInCurDir()<CR>', opts)

vim.g.NERDTreeIgnore = { '^node_modules$', '^.git$', '^vendor$' }
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeWinSize = 60
vim.g.NERDTreeCascadeOpenSingleChildDir = 0
vim.g.NERDTreeCascadeSingleChildDir = 0