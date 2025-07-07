![image](https://user-images.githubusercontent.com/9198690/210136444-a87eb355-f08f-4451-a2e5-5d90b7bf8a0c.png)

# Installation

There are many ways to install NeoVim, but a nice way I use is through [Bob](https://github.com/MordechaiHadad/bob.git):

```sh
# install cargo (rust pkg manager)
curl https://sh.rustup.rs -sSf | sh

# install bob
cargo install --git https://github.com/MordechaiHadad/bob.git

# install NeoVim
bob install v0.9.2
```

# Installation

1. Copy/symlink files from this directory into `$HOME/.config/nvim`.
2. Open `nvim` and wait for plugins to be installed
3. Restart `nvim` and you should be ready to go.

# Wishlist

- Better vi(m) compatibility

# Debugging

[nvim-dap](https://github.com/mfussenegger/nvim-dap) is used to manage debug adapters. Debug adapters are installed through `:Mason`.

Any further debug adapter configs can be added in `./lua/rhydian/configs/dap/*.lua` and imported in `./after/plugin/dap.lua`
