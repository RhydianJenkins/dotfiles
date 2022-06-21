export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/share/pnpm/nodejs/16.7.0/bin:$HOME/.cargo/bin:$HOME/.deno/bin:$HOME/.config/composer/vendor/bin:/usr/local/go/bin:$HOME/.config/nvim/vim-plugged/phpactor/bin:$HOME/.local/bin:$HOME/.config/nvim/vim-plugged/lua-language-server/bin:$HOME/.local/share/neovim/bin:$PATH
export ZSH="/home/rhydian/.oh-my-zsh"
export EDITOR=$(which nvim)

ZSH_THEME="gallois"
HYPHEN_INSENSITIVE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"

# $ZSH/plugins/ <- standard plugins dir
# $ZSH_CUSTOM/plugins/ <- custom plugins dir
plugins=(
    git
    nvm
    colorize
    ssh-agent
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# load omzsh if exists
[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh

# load alias file if exists
[ -f ~/.aliases ] && source ~/.aliases

# load functions file if exists
[ -f ~/.functions ] && source ~/.functions

# evaluate any custom sources defined
[ -f ~/.custom_sources ] && source ~/.custom_sources

# define where plugins get installed
PLUGINS_DIR="$ZSH_CUSTOM/plugins"

# install missing plugins
if [ ! -d "${PLUGINS_DIR}/zsh-autosuggestions" ]; then
    echo "Missing zsh-autosuggestions plugin. Installing..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "${PLUGINS_DIR}"/zsh-autosuggestions
fi

if [ ! -d "${PLUGINS_DIR}/zsh-syntax-highlighting" ]; then
    echo "Missing zsh-syntax-highlighting plugin. Installing..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "${PLUGINS_DIR}"/zsh-syntax-highlighting
fi

if [ ! -f ~/.fzf.bash ]; then
   echo "Missing fzf, installing in ~/.fzf" # also usable in bash
   git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# quietly start ssh agent
eval `ssh-agent -s` &> /dev/null

