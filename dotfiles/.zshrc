PATHS=(
    $HOME/bin
    $HOME/.local/share/pnpm/nodejs/16.7.0/bin
    $HOME/.cargo/bin
    $HOME/.deno/bin
    $HOME/.config/composer/vendor/bin
    $HOME/.config/nvim/vim-plugged/phpactor/bin
    $HOME/.local/bin
    $HOME/.config/nvim/vim-plugged/lua-language-server/bin
    $HOME/.local/share/neovim/bin
    /usr/local/bin
    /usr/local/go/bin
)

export PATH=$(printf "%s:" "${PATHS[@]}")$PATH
export ZSH="/home/rhydian/.oh-my-zsh"
export EDITOR=$(which nvim)
export USE_GKE_GCLOUD_AUTH_PLUGIN=False

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

[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh
[ -d ~/Pictures/Wallpapers ] && feh --randomize --bg-fill ~/Pictures/Wallpapers/*

PLUGINS_DIR="$ZSH_CUSTOM/plugins"

if [ ! -d "${PLUGINS_DIR}/zsh-autosuggestions" ]; then
    echo "Missing zsh-autosuggestions plugin. Installing..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "${PLUGINS_DIR}"/zsh-autosuggestions
fi

if [ ! -d "${PLUGINS_DIR}/zsh-syntax-highlighting" ]; then
    echo "Missing zsh-syntax-highlighting plugin. Installing..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "${PLUGINS_DIR}"/zsh-syntax-highlighting
fi

if [ ! -d $HOME/.fzf ]; then
    echo "Missing fzf, installing in ~/.fzf" # also usable in bash
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
fi
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

eval `ssh-agent -s` &> /dev/null

[ -f $HOME/.aliases ] && source $HOME/.aliases
[ -f $HOME/.functions ] && source $HOME/.functions
[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load tmuxifier if present in PATH
if type -p "tmuxifier" >/dev/null; then
    [ -f $HOME/.tmuxifier ] && source $HOME/.tmuxifier
fi

# set keyboard repeat rate
if [ -f /usr/bin/xset ]; then
  xset r rate 200 40
fi
