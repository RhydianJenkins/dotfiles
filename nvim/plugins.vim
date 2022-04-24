" plugins
call plug#begin('~/.config/nvim/vim-plugged')
    Plug 'nvim-lua/popup.nvim' " allows overlays
    Plug 'nvim-lua/plenary.nvim' " adds lua functions
    Plug 'preservim/nerdtree' " left navigation panel
    Plug 'nvim-telescope/telescope.nvim' " fzf file search
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' } " speed bonus for fzf file search
    Plug 'nvim-telescope/telescope-frecency.nvim' " prioritise results based on recently used (needs sqlite)
    Plug 'tami5/sqlite.lua' " sqlite dependency
    Plug 'vim-airline/vim-airline' " bottom status bar
    Plug 'vim-airline/vim-airline-themes' " make airline look pretty
    Plug 'scrooloose/nerdcommenter' " comment blocks of code
    Plug 'kqito/vim-easy-replace' " <leader>ra - find and replace all
    Plug 'vim-vdebug/vdebug' " debugger
    Plug 'tomasiser/vim-code-dark' " theme
    Plug 'APZelos/blamer.nvim' " git blame
    Plug 'ntpeters/vim-better-whitespace' " strip trailing whitespace
    Plug 'ellisonleao/glow.nvim', {'branch': 'main'} " md preview
    Plug 'j-hui/fidget.nvim' " bottom right updates on tasks
    Plug 'lewis6991/gitsigns.nvim' " git integration to show additions/etc
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " allow things to query the tree
    Plug 'mg979/vim-visual-multi', {'branch': 'master'} " multi line select/edit
    Plug 'lewis6991/impatient.nvim' " speed up lua module loadtimes (caching)
    Plug 'folke/which-key.nvim' " help for keybindings
    Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' } " AI code assistant
    Plug 'ryanoasis/vim-devicons' " adds icons
    Plug 'vim-test/vim-test' " allows running of tests
    Plug 'sudormrfbin/cheatsheet.nvim' " telescope cheatsheet

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
    Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
    Plug 'jose-elias-alvarez/null-ls.nvim'
    Plug 'lukas-reineke/lsp-format.nvim'
    Plug 'sumneko/lua-language-server'
call plug#end()
