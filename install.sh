#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

read -r -p "WARNING: You're about to relace your current dotfiles with these new ones. Are you sure? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	# Just link and erase all dotfiles to $HOME
	ln -sf $SCRIPT_DIR/dotfiles/.[a-z]* ~/
	echo "Dotfiles linked"
else
	echo "Exiting without executing"
fi

# prompt to install apt packages
echo "Time to intall stuff: "
echo "sudo apt update && sudo apt install neovim curl ripgrep"

