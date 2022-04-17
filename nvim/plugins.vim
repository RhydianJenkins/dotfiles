" plugins
call plug#begin('~/.config/nvim/vim-plugged')
    Plug 'nvim-lua/popup.nvim' " allows overlays
    Plug 'nvim-lua/plenary.nvim' " adds lua functions
    Plug 'preservim/nerdtree' " left navigation panel
    Plug 'nvim-telescope/telescope.nvim' " fzf file search
    Plug 'nvim-telescope/telescope-fzf-native.nvim' " speed bonus for fzf file search
    Plug 'dense-analysis/ale' " async lint engine
    Plug 'itchyny/lightline.vim' " status line at bottom
    Plug 'neoclide/coc.nvim' " code completion engine
    Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
call plug#end()
