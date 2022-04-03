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
set hlsearch
set wildmode=longest,list
set clipboard=unnamedplus
set ignorecase

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
    Plug 'dense-analysis/ale'
    Plug 'neovim/nvim-lspconfig'
call plug#end()

" toggle file explorer
nnoremap <C-b> :NERDTreeToggle<CR>

" find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

