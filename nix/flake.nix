{
    inputs = {
        nixpkgs = {
            url = "github:nixos/nixpkgs/nixos-24.11";
        };
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { nixpkgs, home-manager, ... }: let
        system = "x86_64-linux";
        lib = nixpkgs.lib;
        pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
        };
    in {
        nixosConfigurations = {
            personal = lib.nixosSystem {
                inherit system;
                modules = [
                    ./system/configuration.nix
                    ./system/personal.nix
                ];
            };
        };

        homeConfigurations = {
            personal = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                    ./user/home.nix
                    ./user/personal.nix
                ];
            };
        };

        devShells.${system}.default = pkgs.mkShell {
            buildInputs = [
            ];
        };
    };
}
