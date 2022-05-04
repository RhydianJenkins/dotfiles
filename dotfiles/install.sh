#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

read -r -p "WARNING: You're about to relace your current dotfiles with these new ones. Are you sure? [y/N] " response
if ! [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    echo "Exiting without executing"
    exit 1
fi

# Just link and erase all dotfiles to $HOME
ln -sf $SCRIPT_DIR/.[a-z]* ~/
echo "Dotfiles linked. Time to intall stuff: "
echo ""

# prompt to install apt packages
echo "sudo apt update && sudo apt install curl ripgrep sqlite3 libsqlite3-dev pip python-neovim python3-neovim fd-find pkg-config libssl-dev"
