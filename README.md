# .dotfiles
Some config for my own personal use.

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

# Installing NeoVim

Neovim v0.7.0^ is currently required for the setup.

There are many ways to install neovim, but a nice way I use is through [Bob](https://github.com/MordechaiHadad/bob.git):

```sh
curl https://sh.rustup.rs -sSf | sh # install cargo (rust pkg manager)
cargo install --git https://github.com/MordechaiHadad/bob.git # install bob
bob install v0.7.0
```

# Nerd Fonts

For icons to work, [NerdFonts](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts) are needed to be installed.

After downloading some `.tff` files, place them in the `$HOME/.local/share/fonts/NerdFonts` directory and set your terminal font to that nerd font.
