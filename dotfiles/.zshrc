PATHS=(
    $HOME/bin
    $HOME/.cargo/bin
    $HOME/.deno/bin
    $HOME/.local/bin
    /usr/local/bin
)

export PATH=$(printf "%s:" "${PATHS[@]}")$PATH

HYPHEN_INSENSITIVE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"

[ -f $HOME/.aliases ] && source $HOME/.aliases
[ -f $HOME/.functions ] && source $HOME/.functions

[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local

# turn off annoying bell
unsetopt BEEP
