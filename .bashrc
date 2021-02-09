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

#-------------------
# Personnal Aliases
#-------------------

# show line numbers with less
alias less='less -N'

# ssh
alias ssh-keygen='ssh-keygen -t ed25519' # elliptic curve keygen, shorter, more secure

# navigation
alias des='desktop'
alias desktop="echo 'You forgot to set desktop path in .bash_aliases'"
alias docs='documents'
alias documents="echo 'You forgot to set docs path in .bash_aliases'"

# utility
alias c='clear'
alias C='clear'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias h='history'
alias j='jobs -l'
alias ..='cd ..'
alias du='du -kh'
alias df='df -kTh'
alias grep='grep --color=auto'
alias lint='npm run lint'

# git
alias gs='git status'
alias gp='git pull'

# pretty-print PATH
alias path='echo -e ${PATH//:/\\n}'

# ls
alias ll='ls --color=auto -laF --group-directories-first'
alias lr='ll -R' #  recursive ls
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...

# load alias file if exists
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#-------------------
# Functions
#-------------------

# Swap 2 filenames around, if they exist (from Uzi's bashrc).
function swap() {
    local TMPFILE=tmp.$$

    [ $# -ne 2 ] && echo "swap: 2 arguments needed" && return 1
    [ ! -e $1 ] && echo "swap: $1 does not exist" && return 1
    [ ! -e $2 ] && echo "swap: $2 does not exist" && return 1

    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

# Handy Extract Program
function extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}


# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }

# find a file containing a string
find() {
    if [ $# = 1 ]
    then
        command find . -iname "*$@*"
    else
        command find "$@"
    fi
}

# weather forecast
# Usage: `weather CITYNAME` or just `weather` to use your IP addr. location.
function weather() {
    curl http://wttr.in/${1}
}

#-------------------
# SSH
#-------------------

# quietly start ssh agent
eval `ssh-agent -s` &> /dev/null

# quietly add all '~/.ssh/*_key' keys
for possiblekey in ${HOME}/.ssh/*_key; do
    if grep -q PRIVATE "$possiblekey"; then
        ssh-add "$possiblekey" &> /dev/null
    fi
done
