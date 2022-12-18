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

local opts = { noremap = true, silent = true, desc = "Toggle NERDTree at current buffer's directory" }
vim.keymap.set("n", "<C-b>", "<cmd>call NERDTreeToggleInCurDir()<CR>", opts)

vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeWinSize = 60
vim.g.NERDTreeCascadeOpenSingleChildDir = 0
vim.g.NERDTreeCascadeSingleChildDir = 0
vim.g.NERDTreeIgnore = {
    "%.o",
    "%.a",
    "%.out",
    "%.class",
    "%.pdf",
    "%.mkv",
    "%.mp4",
    "%.zip",
    "^node_modules$",
    "^vendor$",
    ".git/",
    "^cache$",
    "^babel-cache$",
    "^tmp$",
    ".phar$",
    ".min.js$",
}
