# NixOS Config Flake

Contains a system-level and user-level (managed by home-manager) flake that installs personal config.

# Building

```sh
# ensure nix has flakes and nix-command experimental features, if building for the first time
sudo nix --extra-experimental-features "nix-command flakes" build .#nixosConfigurations.personal.config.system.build.toplevel

# from this nix dir, apply system config
sudo nixos-rebuild switch --flake .#personal

```

# Home Manager

https://nix-community.github.io/home-manager/index.xhtml#ch-installation

```sh
# Caution
# TODO this is pointing to the unstable home manager channel, where we don't really want that...
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

# from this nix dir, apply home config
home-manager switch --flake .#personal
```
