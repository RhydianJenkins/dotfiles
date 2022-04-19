" plugins
call plug#begin('~/.config/nvim/vim-plugged')
    Plug 'nvim-lua/popup.nvim' " allows overlays
    Plug 'nvim-lua/plenary.nvim' " adds lua functions
    Plug 'preservim/nerdtree' " left navigation panel
    Plug 'nvim-telescope/telescope.nvim' " fzf file search
    Plug 'nvim-telescope/telescope-fzf-native.nvim' " speed bonus for fzf file search
    Plug 'vim-airline/vim-airline' " bottom status bar
    Plug 'vim-airline/vim-airline-themes' " make airline look pretty
    Plug 'scrooloose/nerdcommenter' " comment blocks of code
    Plug 'kqito/vim-easy-replace' " find and replace
    Plug 'vim-vdebug/vdebug' " debugger

    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
call plug#end()

" include the language servers
:lua require'lspconfig'.phpactor.setup{}

