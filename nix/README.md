# NixOS Config Flake

Contains a system-level and user-level (managed by home-manager) flake that installs personal config.

# First time?

First, you will need to add your new system to the flake's nixos modules.

```sh
# copy hardware-configuration.nix in
cp /etc/nixos/hardware-configuration.nix ~/dotfiles/nix/system/<YOUR_NEW_SYSTEM>
```

# Building

```sh
# from this nix dir, apply system config (swapping the flake based on what machine you're on)
sudo nixos-rebuild switch --flake .#<YOUR_NEW_SYSTEM>

```

# Home Manager

https://nix-community.github.io/home-manager/index.xhtml#ch-installation

```sh
# home-manager is not installed by default, but this flake provides a shell where you can use it to install itself
# note: this is only needed once
nix develop

# then just install as normal...
home-manager switch --flake .#<WHATEVER>
```

# TODOs

- [ ] hardware-configuration needs to point to /etc/nixos/hardware-configuration.nix. I can't just gitignore it as flakes only deal with files tracked with git...
