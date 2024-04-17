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
export ZSH=$HOME/.oh-my-zsh
export EDITOR=$(which nvim)

ZSH_THEME="gallois"
HYPHEN_INSENSITIVE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"

# $ZSH/plugins/ <- standard plugins dir
# $ZSH_CUSTOM/plugins/ <- custom plugins dir
plugins=(
    # managed by nix
)

[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh

if [ ! $ZSH_CUSTOM ]; then
    ZSH_CUSTOM="$ZSH/custom"
fi

PLUGINS_DIR="$ZSH_CUSTOM/plugins"

if [ ! -d $HOME/.fzf ]; then
    echo "Missing fzf, installing in ~/.fzf"
    echo "Be sure to `sudo ~/.fzf/install`"
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
fi
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

eval `ssh-agent -s` &> /dev/null

[ -f $HOME/.aliases ] && source $HOME/.aliases
[ -f $HOME/.functions ] && source $HOME/.functions

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

if type -p "tmuxifier" >/dev/null; then
    [ -f $HOME/.tmuxifier ] && source $HOME/.tmuxifier
fi

if [ -f /usr/bin/xset ]; then
  xset r rate 200 40
  xset s off
fi

[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local

# turn off annoying bell
unsetopt BEEP
