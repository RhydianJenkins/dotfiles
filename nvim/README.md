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

- Better vi(m) compatibility
- Run language servers in docker containers for work ([Plugin?](https://github.com/lspcontainers/lspcontainers.nvim))
- (Better) debugging

# GitHub Copilot

[copilot.lua](https://github.com/zbirenbaum/copilot.lua) is currecntly used for copilot suggestions. Currently, this plugin doesn't support the authentication step, so the original [copilot.vim](https://github.com/github/copilot.vim) is needed to generate files in `~/.config/github-copilot`.

Once auth is handled, the vimscript version can be uninstalled.

[copilot-cmp](https://github.com/zbirenbaum/copilot-cmp) is used to turn suggestions into cmp completions.

![image](https://user-images.githubusercontent.com/9198690/178099328-ea886b45-e071-40a4-8f27-5ee262b81ec0.png)

