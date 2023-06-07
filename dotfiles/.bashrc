# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# to run upon exit of shell.
function _exit() {
    echo -e "Hasta la vista, baby"
}
trap _exit EXIT

# build prompts
export PS1="[\[\e[32m\]\A\[\e[m\]] \[\e[35;40m\]\w \[\e[m\]\$ "
export PS2="> "

# load alias file if exists
if [ -f $HOME/.aliases ]; then
    . $HOME/.aliases
else
    echo "No .aliases file found."
fi

# load functions file if exists
if [ -f $HOME/.functions ]; then
    . $HOME/.functions
else
    echo "No .functions file found. Ignoring..."
fi

# quietly start ssh agent and quietly add all '$HOME/.ssh/*_key' keys
eval `ssh-agent -s` &> /dev/null
for possiblekey in ${HOME}/.ssh/*_key; do
    if grep -q PRIVATE "$possiblekey"; then
        ssh-add "$possiblekey" &> /dev/null
    fi
done
