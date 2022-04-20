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

" CTRL + s to save
nnoremap <C-s> :w<CR>

" CTRL + w to close current buffer
nnoremap <C-w> :bd<CR>

" Tab navigation of buffers
nnoremap <Tab> :bn<CR>
nnoremap <S-tab> :bprevious<CR>

" load plugin configs
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/plugins/nerdtree.vim
source $HOME/.config/nvim/plugins/telescope.vim
source $HOME/.config/nvim/plugins/airline.vim
source $HOME/.config/nvim/plugins/popup.vim
source $HOME/.config/nvim/plugins/codedark.vim
source $HOME/.config/nvim/plugins/blamer.vim
source $HOME/.config/nvim/plugins/glow.vim
luafile $HOME/.config/nvim/plugins/lspconfig.lua
luafile $HOME/.config/nvim/plugins/gitsigns.lua
luafile $HOME/.config/nvim/plugins/telescope.lua
