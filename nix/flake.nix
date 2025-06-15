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
    };

    outputs = { nixpkgs, home-manager, nix-index-database, ... }: let
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
        };

        homeConfigurations = {
            personal = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                    ./user/home.nix
                    nix-index-database.hmModules.nix-index
                    ({ ... }: {
                        _module.args.customPkgs = {
                            customTableplus = pkgs.callPackage ./customPkgs/tableplus.nix {};
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
