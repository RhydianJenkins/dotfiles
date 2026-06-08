# NixOS Config Flake

Contains a system-level and user-level (managed by home-manager) flake that installs personal config.

# First time?

First, you will need to add your new system to the flake's nixos modules.

```sh
# copy hardware-configuration.nix in
cp /etc/nixos/hardware-configuration.nix ~/dotfiles/nix/system/machines/<YOUR_NEW_SYSTEM>/hardware-configuration.nix
```

Then, you'll need to add `<YOUR_NEW_SYSTEM>` to `nixosConfigurations` in `flake.nix`

# Secrets

You'll have to make a `~/.secrets.nix` file that contains all the values you don't want to commit to source:

```nix
# ~/.secrets.nix
{
    uwDnsServer = "";
    uwDnsDomains = [];
}
```

... and update it every time it chagnes

```sh
nix flake update secrets-file
rebuild
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
