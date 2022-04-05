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

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" plugins
call plug#begin()
    Plug 'nvim-lua/popup.nvim' " allows overlays
    Plug 'nvim-lua/plenary.nvim' " adds lua functions
    Plug 'preservim/nerdtree' " navigation panel
    Plug 'nvim-telescope/telescope.nvim' " fzf file search
    Plug 'nvim-telescope/telescope-fzf-native.nvim' " speed bonus for fzf file search
    Plug 'dense-analysis/ale' " async lint engine
    Plug 'itchyny/lightline.vim' " Status line at bottom
    Plug 'neovim/nvim-lspconfig' " language server protocols
call plug#end()

" toggle file explorer
nnoremap <C-b> :NERDTreeToggle<CR>

" find files using Telescope command-line sugar.
let mapleader = " " " make space <leader> key

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
