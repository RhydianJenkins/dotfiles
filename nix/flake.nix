{
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
        lib = nixpkgs.lib;
        pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
        };
    in {
        nixosConfigurations = {
            work-laptop = lib.nixosSystem {
                inherit system;
                modules = [
                    ./system/work-laptop/configuration.nix
                ];
            };

            personal-laptop = lib.nixosSystem {
                inherit system;
                modules = [
                    ./system/personal-laptop/configuration.nix
                ];
            };
        };

        homeConfigurations = {
            personal = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                    ./configs/browsers.nix
                    ./configs/editors.nix
                    ./configs/git.nix
                    ./configs/keybase.nix
                    ./configs/user.nix
                    ./configs/wezterm.nix
                    nix-index-database.homeModules.nix-index
                    ({ ... }: {
                        _module.args.customPkgs = {
                            customStoplight = pkgs.callPackage ./customPkgs/stoplight.nix {};
                            customTableplus = pkgs.callPackage ./customPkgs/tableplus.nix {};
                            apix = apix.packages.${system}.apix;
                        };
                    })
                ];
            };
        };

        devShells.${system}.default = pkgs.mkShell {
            buildInputs = [
            ];
        };
    };
}
