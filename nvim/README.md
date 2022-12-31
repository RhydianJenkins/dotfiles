![image](https://user-images.githubusercontent.com/9198690/210136444-a87eb355-f08f-4451-a2e5-5d90b7bf8a0c.png)

# Installation

Neovim v0.8.1^ is currently required for the setup.

There are many ways to install NeoVim, but a nice way I use is through [Bob](https://github.com/MordechaiHadad/bob.git):

```sh
# install cargo (rust pkg manager)
curl https://sh.rustup.rs -sSf | sh

# install bob
cargo install --git https://github.com/MordechaiHadad/bob.git

# install NeoVim
bob install v0.8.1
```

# Config

1. Copy files from this directory into `$HOME/.config/nvim`.
2. Open `nvim` and run `:PackerSync`.
3. Restart `nvim` and you should be ready to go.

# Wishlist

- Better vi(m) compatibility
- Maybe better abstraction of lsp installation with [lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim)

# GitHub Copilot

[copilot.lua](https://github.com/zbirenbaum/copilot.lua) is used for copilot suggestions.

[copilot-cmp](https://github.com/zbirenbaum/copilot-cmp) is used to turn suggestions into cmp completions.

![image](https://user-images.githubusercontent.com/9198690/178099328-ea886b45-e071-40a4-8f27-5ee262b81ec0.png)

# ChatGPT

Ensure`$OPENAI_API_KEY` environment variable exists. [Obtain a key](https://beta.openai.com/account/api-keys).

`:ChatGPT` opens a prompt.

# Debugging

[nvim-dap](https://github.com/mfussenegger/nvim-dap) is used to manage debug adapters. You'll have to alter the `phpDebugPath` in [php.lua](./lua/rhydian/configs/dap/php.lua) to point to an [xdebug php adapter](https://github.com/xdebug/vscode-php-debug) installed on your system.

Any further debug adapter configs can be added in `./lua/rhydian/configs/dap/*.lua` and imported in `./after/plugin/dap.lua`
