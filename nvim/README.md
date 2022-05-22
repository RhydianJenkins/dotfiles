# Installing NeoVim

Neovim v0.7.0^ is currently required for the setup.

There are many ways to install neovim, but a nice way I use is through [Bob](https://github.com/MordechaiHadad/bob.git):

```sh
curl https://sh.rustup.rs -sSf | sh # install cargo (rust pkg manager)
cargo install --git https://github.com/MordechaiHadad/bob.git # install bob
bob install v0.7.0
```

# Neovim Config

1. Copy these files into `~/.config/nvim`.
2. Open neovim and run `:PlugInstall`.
3. Restart Nvim and you should be ready to go.

# Wishlist

- Github Copilot (without ghost text NeoVim issue)
- Convert lua
- Optional config to allow up and running with less effort, e.g. no tabnine if not logged in
- SQL interaction with the database
