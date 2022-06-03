" Ensure vim-plug is installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" load plugins
call plug#begin('~/.config/nvim/vim-plugged')
    Plug 'nvim-lua/popup.nvim' " allows overlays
    Plug 'nvim-lua/plenary.nvim' " adds lua functions
    Plug 'preservim/nerdtree' " left navigation panel
    Plug 'nvim-telescope/telescope.nvim' " fzf file search
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' } " speed bonus for fzf file search
    Plug 'nvim-telescope/telescope-frecency.nvim' " prioritise results based on recently used (needs sqlite)
    Plug 'tami5/sqlite.lua' " sqlite dependency
    Plug 'scrooloose/nerdcommenter' " comment blocks of code
    Plug 'kqito/vim-easy-replace' " <leader>ra - find and replace all
    Plug 'vim-vdebug/vdebug' " debugger
    Plug 'APZelos/blamer.nvim' " git blame
    Plug 'ntpeters/vim-better-whitespace' " strip trailing whitespace
    Plug 'ellisonleao/glow.nvim', {'branch': 'main'} " md preview
    Plug 'j-hui/fidget.nvim' " bottom right updates on tasks
    Plug 'lewis6991/gitsigns.nvim' " git integration to show additions/etc
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " allow things to query the tree
    Plug 'p00f/nvim-ts-rainbow' " ranbow parenthesis to help with scopes
    Plug 'lewis6991/impatient.nvim' " speed up lua module loadtimes (caching)
    Plug 'folke/which-key.nvim' " help for keybindings
    Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' } " AI code assistant
    Plug 'kyazdani42/nvim-web-devicons' " adds icons and colors
    Plug 'vim-test/vim-test' " allows running of tests
    Plug 'mhinz/vim-startify' " fancy start/splash screen
    Plug 'beyondwords/vim-twig' " twig syntax highlighting
    Plug 'ggandor/lightspeed.nvim' " go to specific word
    Plug 'yuezk/vim-js' " js(x) highlighting
    Plug 'maxmellon/vim-jsx-pretty' " jsx formatting
    Plug 'morhetz/gruvbox' " color theme
    Plug 'rrethy/vim-illuminate' " highlight words on cursor over
    Plug 'theprimeagen/git-worktree.nvim' " manage git worktree
    Plug 'onsails/lspkind.nvim' " adds icons to completion list
    Plug 'theprimeagen/harpoon' " marks utility
    Plug 'norcalli/nvim-colorizer.lua' " adds color display for colors
    Plug 'petertriho/nvim-scrollbar' " adds scrollbar
    Plug 'beauwilliams/focus.nvim' " window resize on focus
    Plug 'SmiteshP/nvim-gps' " status line component to show cursor position
    Plug 'feline-nvim/feline.nvim' " status line
    Plug 'akinsho/bufferline.nvim' " show buffers at the top
    Plug 'RishabhRD/popfix' " requirement for Rishabh plugins
    Plug 'RishabhRD/nvim-cheat.sh' " easy access to cheat.sh

    " LSP
    Plug 'williamboman/nvim-lsp-installer' " used to install langage servers
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-nvim-lua'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
    Plug 'jose-elias-alvarez/null-ls.nvim'
    Plug 'lukas-reineke/lsp-format.nvim'
call plug#end()

" load plugin configs
luafile $HOME/.config/nvim/plugins/impatient.lua
source $HOME/.config/nvim/plugins/nerdtree.vim
luafile $HOME/.config/nvim/plugins/gruvbox.lua
luafile $HOME/.config/nvim/plugins/vdebug.lua
luafile $HOME/.config/nvim/plugins/vimtest.lua
luafile $HOME/.config/nvim/plugins/devicons.lua
luafile $HOME/.config/nvim/plugins/feline.lua
luafile $HOME/.config/nvim/plugins/glow.lua
luafile $HOME/.config/nvim/plugins/blamer.lua
luafile $HOME/.config/nvim/plugins/lspinstaller.lua
luafile $HOME/.config/nvim/plugins/cmp.lua
luafile $HOME/.config/nvim/plugins/lspconfig.lua
luafile $HOME/.config/nvim/plugins/treesitter.lua
luafile $HOME/.config/nvim/plugins/gps.lua
luafile $HOME/.config/nvim/plugins/gitsigns.lua
luafile $HOME/.config/nvim/plugins/telescope.lua
luafile $HOME/.config/nvim/plugins/fidget.lua
luafile $HOME/.config/nvim/plugins/whichkey.lua
luafile $HOME/.config/nvim/plugins/tabnine.lua
luafile $HOME/.config/nvim/plugins/illuminate.lua
luafile $HOME/.config/nvim/plugins/gitworktree.lua
luafile $HOME/.config/nvim/plugins/harpoon.lua
luafile $HOME/.config/nvim/plugins/colorizer.lua
luafile $HOME/.config/nvim/plugins/scrollbar.lua
luafile $HOME/.config/nvim/plugins/focus.lua
luafile $HOME/.config/nvim/plugins/bufferline.lua
luafile $HOME/.config/nvim/plugins/nerdcommenter.lua
