# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/rhydian/.oh-my-zsh"

# ZSH_THEME="random"
ZSH_THEME="gallois"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Disable marking untracked files under VCS as dirty.
# This makes repository status check for large repositories much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Standard plugins found in $ZSH/plugins/
# Custom plugins added to $ZSH_CUSTOM/plugins/
plugins=(git nvm colorize command-not-found ssh-agent)

source $ZSH/oh-my-zsh.sh

# load alias file if exists
if [ -f ~/.aliases ]; then
    . ~/.aliases
else
    echo "No .aliases file found."
fi

# load functions file if exists
if [ -f ~/.functions ]; then
    . ~/.functions
else
    echo "No .functions file found. Ignoring..."
fi

# `ssh-agent` plugin started, quietly add all '~/.ssh/*_key' keys
for possiblekey in ${HOME}/.ssh/*_key; do
    if grep -q PRIVATE "$possiblekey"; then
        ssh-add "$possiblekey" &> /dev/null
    fi
done
