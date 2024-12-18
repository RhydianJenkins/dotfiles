{
    inputs = {
        nixpkgs = {
            url = "github:nixos/nixpkgs/nixos-unstable";
        };
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { nixpkgs, home-manager, ... }: let
        system = "x86_64-linux";
        lib = nixpkgs.lib;
        pkgs = nixpkgs.legacyPackages.${system};
    in {
        nixosConfigurations.nixos = lib.nixosSystem {
            inherit system;
            modules = [ ./system/configuration.nix ];
        };

        homeConfigurations.rhydian = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [ ./user/home.nix ];
        };
    };
}
