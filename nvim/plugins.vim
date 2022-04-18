" plugins
call plug#begin('~/.config/nvim/vim-plugged')
    Plug 'nvim-lua/popup.nvim' " allows overlays
    Plug 'ervandew/supertab' " <tab> suggestion completion
    Plug 'nvim-lua/plenary.nvim' " adds lua functions
    Plug 'preservim/nerdtree' " left navigation panel
    Plug 'nvim-telescope/telescope.nvim' " fzf file search
    Plug 'nvim-telescope/telescope-fzf-native.nvim' " speed bonus for fzf file search
    Plug 'dense-analysis/ale' " async lint engine
    Plug 'neoclide/coc.nvim' " code completion engine
    Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
    Plug 'vim-airline/vim-airline' " bottom status bar
    Plug 'vim-airline/vim-airline-themes' " make airline look pretty
    Plug 'scrooloose/nerdcommenter' " comment blocks of code
call plug#end()
