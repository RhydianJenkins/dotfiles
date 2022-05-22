# Installation

Neovim v0.7.0^ is currently required for the setup.

There are many ways to install NeoVim, but a nice way I use is through [Bob](https://github.com/MordechaiHadad/bob.git):

```sh
# install cargo (rust pkg manager)
curl https://sh.rustup.rs -sSf | sh

# install bob
cargo install --git https://github.com/MordechaiHadad/bob.git

# install NeoVim
bob install v0.7.0
```

# Config

1. Copy files from this directory into `$HOME/.config/nvim`.
2. Open `nvim` and run `:PlugInstall`.
3. Restart `nvim` and you should be ready to go.

# Wishlist

- Github Copilot (without ghost text NeoVim issue)
- SQL interaction with the database
- Better vi(m) compatibility
