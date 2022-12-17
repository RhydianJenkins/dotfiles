#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

read -r -p "WARNING: You're about to relace your current dotfiles with these new ones. Are you sure? [y/N] " response
if ! [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    echo "Exiting without executing"
    exit 1
fi

# Just link and erase all dotfiles to $HOME
ln -sf $SCRIPT_DIR/.[a-z]* ~/
echo "Dotfiles linked. "

read -r -p "Install all packages listed in pkglist? [y/N] " response
if ! [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    echo "Exiting without installing packages"
    exit 1
fi

sudo apt-get update && sudo apt-get install $(cat "./pkglist")
