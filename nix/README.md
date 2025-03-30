# NixOS Config Flake

Contains a system-level and user-level (managed by home-manager) flake that installs personal config.

# Building

```sh
# ensure nix has flakes and nix-command experimental features, if building for the first time
sudo nix --extra-experimental-features "nix-command flakes" build .#nixosConfigurations.rhydian.config.system.build.toplevel

# to update the lock file later on
nix flake update

# from this nix dir, apply system config
sudo nixos-rebuild switch --flake .#personal

```

# Home Manager

https://nix-community.github.io/home-manager/index.xhtml#ch-installation

```sh
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

# from this nix dir, apply home config
home-manager switch --flake .
```
