# NixOS Config Flake

# Building

```sh
# ensure nix has flakes and nix-command experiemental features, if building for the first timec
sudo nix --extra-experimental-features "nix-command flakes" build .#nixosConfigurations.rhydian.config.system.build.toplevel

sudo nixos-rebuild switch --flake .#rhydian
```
