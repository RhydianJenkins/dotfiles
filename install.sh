#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

read -r -p "WARNING: You're about to relace your current dotfiles with these new ones. Are you sure? [y/N] " response
if ! [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    echo "Exiting without executing"
    exit 1
fi

# Just link and erase all dotfiles to $HOME
ln -sf $SCRIPT_DIR/dotfiles/.[a-z]* ~/
echo "Dotfiles linked"

# prompt to install apt packages
echo "Time to intall stuff: "
echo "sudo add-apt-repository ppa:neovim-ppa/stable"
echo "sudo apt update"
echo "sudo apt install neovim curl ripgrep sqlite3 libsqlite3-dev pip"

# vim-plug
echo "sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'"
