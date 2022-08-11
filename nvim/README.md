# Installation

Neovim v0.8.0^ is currently required for the setup.

There are many ways to install NeoVim, but a nice way I use is through [Bob](https://github.com/MordechaiHadad/bob.git):

```sh
# install cargo (rust pkg manager)
curl https://sh.rustup.rs -sSf | sh

# install bob
cargo install --git https://github.com/MordechaiHadad/bob.git

# install NeoVim
bob install v0.8.0
```

# Config

1. Copy files from this directory into `$HOME/.config/nvim`.
2. Open `nvim` and run `:PackerSync`.
3. Restart `nvim` and you should be ready to go.

# Wishlist

- Better vi(m) compatibility
- Better automation of installation of language servers and other required binaries

# GitHub Copilot

[copilot.lua](https://github.com/zbirenbaum/copilot.lua) is currecntly used for copilot suggestions. Currently, this plugin doesn't support the authentication step, so the original [copilot.vim](https://github.com/github/copilot.vim) is needed to generate files in `~/.config/github-copilot`.

Once auth is handled, the vimscript version can be uninstalled.

[copilot-cmp](https://github.com/zbirenbaum/copilot-cmp) is used to turn suggestions into cmp completions.

![image](https://user-images.githubusercontent.com/9198690/178099328-ea886b45-e071-40a4-8f27-5ee262b81ec0.png)

# Debugging

[nvim-dap](https://github.com/mfussenegger/nvim-dap) is used to manage debug adapters.

Currently, only the [xdebug php adapter](https://github.com/xdebug/vscode-php-debug) is set up. You'll have to alter the `phpDebugPath` in [php.lua](./lua/rhydian/configs/dap/php.lua) to point to an [xdebug php adapter](https://github.com/xdebug/vscode-php-debug) installed on your system.
