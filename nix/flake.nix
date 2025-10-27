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
    };

    outputs = { nixpkgs, home-manager, nix-index-database, apix, ... }: let
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
                    ./system/modules/i3.nix
                    ./system/machines/work-laptop/configuration.nix
                ];
            };

            personal-laptop = nixpkgs.lib.nixosSystem {
                inherit system;
                modules = [
                    ./system/modules/i3.nix
                    ./system/machines/personal-laptop/configuration.nix
                ];
            };
        };

        homeConfigurations = {
            personal = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                    ./home/modules/browsers.nix
                    ./home/modules/common.nix
                    ./home/modules/editors.nix
                    ./home/modules/git.nix
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
