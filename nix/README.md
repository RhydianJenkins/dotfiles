# NixOS Config Flake

# Building

```sh
# ensure nix has flakes and nix-command experimental features, if building for the first timec
sudo nix --extra-experimental-features "nix-command flakes" build .#nixosConfigurations.rhydian.config.system.build.toplevel

sudo nixos-rebuild switch --flake .

# ... to update the lock file later on:
nix flake update
```

# Home Manager

https://nix-community.github.io/home-manager/index.xhtml#ch-installation


```sh
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

# then to apply home config
home-manager switch --flake .
```
