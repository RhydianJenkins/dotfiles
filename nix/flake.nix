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
        apix = {
            url = "github:rhydianjenkins/apix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        elephant = {
            url = "github:abenz1267/elephant";
        };
        walker = {
            url = "github:abenz1267/walker";
            inputs.elephant.follows = "elephant";
        };
    };

    outputs = { nixpkgs, home-manager, nix-index-database, apix, walker, ... }: let
        system = "x86_64-linux";
        pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
        };
    in {
        nixosConfigurations = {
            work-laptop = nixpkgs.lib.nixosSystem {
                inherit system;
                modules = [
                    ./system/machines/work-laptop/hardware-configuration.nix
                    ./system/modules/common.nix
                    ./system/modules/i3.nix
                ];
            };

            personal-laptop = nixpkgs.lib.nixosSystem {
                inherit system;
                modules = [
                    ./system/machines/personal-laptop/hardware-configuration.nix
                    ./system/modules/common.nix
                    ./system/modules/hyprland.nix
                ];
            };
        };

        homeConfigurations = {
            hyprland = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                    ./home/modules/browsers.nix
                    ./home/modules/common.nix
                    ./home/modules/hyprland.nix
                    ./home/modules/terminal.nix
                    walker.homeManagerModules.default
                    nix-index-database.homeModules.nix-index
                    ({ ... }: {
                        _module.args.customPkgs = {
                            customStoplight = pkgs.callPackage ./home/customPkgs/stoplight.nix {};
                            customTableplus = pkgs.callPackage ./home/customPkgs/tableplus.nix {};
                            apix = apix.packages.${system}.apix;
                        };
                    })
                ];
            };

            i3 = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                    ./home/modules/browsers.nix
                    ./home/modules/common.nix
                    ./home/modules/i3.nix
                    ./home/modules/keybase.nix
                    ./home/modules/terminal.nix
                    nix-index-database.homeModules.nix-index
                    ({ ... }: {
                        _module.args.customPkgs = {
                            customStoplight = pkgs.callPackage ./home/customPkgs/stoplight.nix {};
                            customTableplus = pkgs.callPackage ./home/customPkgs/tableplus.nix {};
                            apix = apix.packages.${system}.apix;
                        };
                    })
                ];
            };
        };
    };
}
