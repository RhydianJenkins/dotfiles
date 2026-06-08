{
  description = "Rhydian's Nix configs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware";

    apix.url = "github:rhydianjenkins/apix";

    seek.url = "github:rhydianjenkins/seek";

    secrets-file = {
      url = "path:/home/rhydian/.secrets.nix";
      flake = false;
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nix-index-database,
      apix,
      seek,
      secrets-file,
      nixos-hardware,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          (import ./home/customPkgs {
            inherit
              apix
              seek
              system
              pkgs-unstable
              ;
          })
        ];
      };

      commonHmModules = [
        ./home/modules/browsers.nix
        ./home/modules/common.nix
        ./home/modules/terminal.nix
        nix-index-database.homeModules.nix-index
      ];

      uwSecrets = import secrets-file;
    in
    {
      nixosConfigurations = {
        uw-laptop = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { secrets = uwSecrets; };
          modules = [
            ./system/machines/uw-laptop/hardware-configuration.nix
            ./system/machines/uw-laptop/default.nix
            ./system/modules/common.nix
            ./system/modules/hyprland.nix
          ];
        };

        home-desktop = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./system/machines/home-desktop/hardware-configuration.nix
            ./system/machines/home-desktop/nvidia.nix
            ./system/modules/common.nix
            ./system/modules/gaming.nix
            ./system/modules/hyprland.nix
          ];
        };
      };

      homeConfigurations = {
        hyprland = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = commonHmModules ++ [
            ./home/modules/hyprland.nix
            ./home/modules/keybase.nix
          ];
        };

        i3 = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = commonHmModules ++ [
            ./home/modules/i3.nix
            ./home/modules/keybase.nix
          ];
        };
      };

      devShells.${system}.default = pkgs.mkShell {
        packages = [
          home-manager.packages.${system}.default
          pkgs.git
          pkgs.tmux
          pkgs.vim
        ];
      };
    };
}
