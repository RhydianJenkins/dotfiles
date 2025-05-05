# NixOS Config Flake

Contains a system-level and user-level (managed by home-manager) flake that installs personal config.

# Building

```sh
# copy hardware-configuration.nix in
cp /etc/nixos/hardware-configuration.nix /path/to/dotfiles/nix/system

# ensure nix has flakes and nix-command experimental features, if building for the first time
# be sure to swap the config for the machine
sudo nix --extra-experimental-features "nix-command flakes" build .#nixosConfigurations.work-laptop.config.system.build.toplevel

# from this nix dir, apply system config (swapping the flake based on what machine you're on)
sudo nixos-rebuild switch --flake .#work-laptop

```

# Home Manager

https://nix-community.github.io/home-manager/index.xhtml#ch-installation

```sh
# Caution
# TODO this is pointing to the unstable home manager channel, where we don't really want that...
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

# from this nix dir, apply home config
nix-shell '<home-manager>' -A install
home-manager switch --flake .#personal
```

# TODOs

- hardware-configuration needs to point to /etc/nixos/hardware-configuration.nix. I can't just gitignore it as flakes only deal with files tracked with git...
- Home manager instructions are for latest. We shouldn't need to do all of that if we're pinning ourselves to a nixpkgs version (24.11 eg)
- Swapfiles are janky, and can cause delays in boot
