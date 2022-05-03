" use vim defaults
set nocompatible

set relativenumber
set nu
set hidden
set noerrorbells
set nowrap
set incsearch
set scrolloff=8
set signcolumn=yes
set colorcolumn=120
set showmatch
set wildmode=longest,list
set clipboard=unnamedplus
set ignorecase
set nohlsearch
set splitright
set splitbelow
set mouse=a
set laststatus=3

" indentation
set autoindent
set smarttab
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4

" case insensitive save and quit
cabb W w
cabb Q q

" make space <leader> key
let mapleader = " "

" CTRL + a to select all
nnoremap <C-a> ggVG

" CTRL + s to save
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>

" CTRL + w to close current buffer
nnoremap <C-w> :bp<bar>sp<bar>bn<bar>bd<CR>

" Tab navigation of buffers
nnoremap <Tab> :bn<CR>
nnoremap <S-tab> :bprevious<CR>

" Window navigation
nnoremap <leader>h <C-W><C-h>
nnoremap <leader>j <C-W><C-j>
nnoremap <leader>k <C-W><C-k>
nnoremap <leader>l <C-W><C-l>
nnoremap <leader>ws <C-W><C-s>
nnoremap <leader>wv <C-W><C-v>
nnoremap <leader>wq <C-W><C-q>
nnoremap <leader>wo <C-W><C-o>

" Highlight yanked text
augroup yank_group
    au!
    au TextYankPost * silent! lua vim.highlight.on_yank()
augroup END

" load plugin configs
source $HOME/.config/nvim/plugins.vim
luafile $HOME/.config/nvim/plugins/impatient.lua
source $HOME/.config/nvim/plugins/nerdtree.vim
source $HOME/.config/nvim/plugins/telescope.vim
source $HOME/.config/nvim/plugins/airline.vim
source $HOME/.config/nvim/plugins/popup.vim
source $HOME/.config/nvim/plugins/gruvbox.vim
source $HOME/.config/nvim/plugins/blamer.vim
source $HOME/.config/nvim/plugins/glow.vim
source $HOME/.config/nvim/plugins/vdebug.vim
source $HOME/.config/nvim/plugins/vimtest.vim
luafile $HOME/.config/nvim/plugins/treesitter.lua
luafile $HOME/.config/nvim/plugins/lspconfig.lua
luafile $HOME/.config/nvim/plugins/gitsigns.lua
luafile $HOME/.config/nvim/plugins/telescope.lua
luafile $HOME/.config/nvim/plugins/fidget.lua
luafile $HOME/.config/nvim/plugins/whichkey.lua
luafile $HOME/.config/nvim/plugins/tabnine.lua
