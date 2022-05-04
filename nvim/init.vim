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

" Highlight yanked text
augroup yank_group
    au!
    au TextYankPost * silent! lua vim.highlight.on_yank()
augroup END

" import keybindings
luafile $HOME/.config/nvim/keybinds.lua

" load plugin configs
source $HOME/.config/nvim/plugins.vim
luafile $HOME/.config/nvim/plugins/impatient.lua
source $HOME/.config/nvim/plugins/nerdtree.vim
source $HOME/.config/nvim/plugins/popup.vim
source $HOME/.config/nvim/plugins/gruvbox.vim
source $HOME/.config/nvim/plugins/vdebug.vim
luafile $HOME/.config/nvim/plugins/vimtest.lua
luafile $HOME/.config/nvim/plugins/airline.lua
luafile $HOME/.config/nvim/plugins/glow.lua
luafile $HOME/.config/nvim/plugins/blamer.lua
luafile $HOME/.config/nvim/plugins/lspinstaller.lua
luafile $HOME/.config/nvim/plugins/lspconfig.lua
luafile $HOME/.config/nvim/plugins/treesitter.lua
luafile $HOME/.config/nvim/plugins/gitsigns.lua
luafile $HOME/.config/nvim/plugins/telescope.lua
luafile $HOME/.config/nvim/plugins/fidget.lua
luafile $HOME/.config/nvim/plugins/whichkey.lua
luafile $HOME/.config/nvim/plugins/tabnine.lua
luafile $HOME/.config/nvim/plugins/illuminate.lua
