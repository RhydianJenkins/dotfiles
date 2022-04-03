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

" indentation
set autoindent
set smarttab
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" plugins
call plug#begin()
    Plug 'nvim-lua/plenary.nvim'
    Plug 'preservim/nerdtree'
    Plug 'nvim-telescope/telescope.nvim'
call plug#end()

nnoremap <C-b> :NERDTreeToggle<CR>

