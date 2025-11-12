{
    description = "Rhydian's Nix configs";

    inputs = {
        nixpkgs = {
            url = "github:nixos/nixpkgs/nixos-25.05";
        };

        home-manager = {
            url = "github:nix-community/home-manager/release-25.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nix-index-database = {
            url = "github:nix-community/nix-index-database";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        apix.url = "github:rhydianjenkins/apix";

        nixos-hardware.url = "github:NixOS/nixos-hardware";
    };

    outputs = { nixpkgs, home-manager, nix-index-database, apix, nixos-hardware, ... }: let
        system = "x86_64-linux";
        pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
        };

        commonHmModules = [
            ./home/modules/ai.nix
            ./home/modules/browsers.nix
            ./home/modules/common.nix
            ./home/modules/terminal.nix
            nix-index-database.homeModules.nix-index
            ({ ... }: {
                _module.args.customPkgs = {
                    customStoplight = pkgs.callPackage ./home/customPkgs/stoplight.nix {};
                    customTableplus = pkgs.callPackage ./home/customPkgs/tableplus.nix {};
                    customOpencode = pkgs.callPackage ./home/customPkgs/opencode.nix {};
                    apix = apix.packages.${system}.apix;
                };
            })
        ];
    in {
        nixosConfigurations = {
            work-laptop = nixpkgs.lib.nixosSystem {
                inherit system;
                modules = [
                    ./system/machines/work-laptop/hardware-configuration.nix
                    ./system/modules/common.nix
                    ./system/modules/hyprland.nix
                    nixos-hardware.nixosModules.dell-xps-15-9510 # omit nvidia for battery life
                ];
            };

            personal-laptop = nixpkgs.lib.nixosSystem {
                inherit system;
                modules = [
                    ./system/machines/personal-laptop/hardware-configuration.nix
                    ./system/modules/common.nix
                    ./system/modules/gaming.nix
                    ./system/modules/hyprland.nix
                    nixos-hardware.nixosModules.dell-xps-15-9560-nvidia
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
    };
}
