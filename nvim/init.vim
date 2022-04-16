set nocompatible " use vim defaults

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

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" find files using Telescope command-line sugar.
let mapleader = " " " make space <leader> key

" load plugin configs
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/plugins/nerdtree.vim
source $HOME/.config/nvim/plugins/telescope.vim
source $HOME/.config/nvim/plugins/ale.vim
