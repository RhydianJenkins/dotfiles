# NixOS Config Flake

# Building

```sh
sudo nix --extra-experimental-features "nix-command flakes" build .#nixosConfigurations.nixos-studio.config.system.build.toplevel
sudo nixos-rebuild switch --flake .#nixos-studio
```
