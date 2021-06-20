#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

read -r -p "WARNING: You're about to relace your current dotfiles with these new ones. Are you sure? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	# Just copy and erase all dotfiles to $HOME
	cp -f $SCRIPT_DIR/dotfiles/.[a-z]* ~/
	echo "Dotfiles replaced"
else
	echo "Exiting without executing"
fi

