export PATH=$HOME/bin:/usr/local/bin:~/.local/share/pnpm/nodejs/16.7.0/bin:$PATH
export ZSH="/home/rhydian/.oh-my-zsh"

ZSH_THEME="gallois"

HYPHEN_INSENSITIVE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# $ZSH/plugins/ <- standard plugins dir
# $ZSH_CUSTOM/plugins/ <- custom plugins dir
plugins=(
    git
    nvm
    colorize
    ssh-agent
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-fzf-history-search
)

source $ZSH/oh-my-zsh.sh

# load alias file if exists
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# load functions file if exists
if [ -f ~/.functions ]; then
    . ~/.functions
fi

# `ssh-agent` plugin started, quietly add all '~/.ssh/*_key' keys
for possiblekey in ${HOME}/.ssh/*_key; do
    if grep -q PRIVATE "$possiblekey"; then
        ssh-add "$possiblekey" &> /dev/null
    fi
done

# colorize suggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"

# install missing plugins
PLUGINS_DIR="$ZSH_CUSTOM/plugins"
if [ ! -d "${PLUGINS_DIR}/zsh-autosuggestions" ]; then
    echo "Missing zsh-autosuggestions plugin. Installing..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${PLUGINS_DIR}/zsh-autosuggestions
fi
if [ ! -d "${PLUGINS_DIR}/zsh-syntax-highlighting" ]; then
    echo "Missing zsh-syntax-highlighting plugin. Installing..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ${PLUGINS_DIR}/zsh-syntax-highlighting
fi
if [ ! -d "${PLUGINS_DIR}/zsh-fzf-history-search" ]; then
    echo "Missing zsh-fzf-history-search plugin. Installing..."
    git clone https://github.com/joshskidmore/zsh-fzf-history-search ${PLUGINS_DIR}/zsh-fzf-history-search
fi
