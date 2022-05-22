# Installing dotfiles

Clone the repo, then run the install script:

> :warning: **This will replace your current dot files in your $HOME**. Be very careful here!

```bash
git clone https://github.com/RhydianJenkins/dotfiles.git
cd dotfiles/dotfiles
./install.sh

# Install some required dependencies
sudo apt update && sudo apt install curl ripgrep sqlite3 libsqlite3-dev pip python-neovim python3-neovim fd-find pkg-config libssl-dev
```

After a shell restart, functions, aliases, and other personal customisations should be applied.
