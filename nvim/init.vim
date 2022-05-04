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

" Highlight yanked text
augroup yank_group
    au!
    au TextYankPost * silent! lua vim.highlight.on_yank()
augroup END

" load keybindings
luafile $HOME/.config/nvim/keybinds.lua

" load plugins
source $HOME/.config/nvim/plugins.vim
