{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs@{ self, nixpkgs, home-manager, ... }:
    let
        user = "rhydian";
    in {
        modules = [
            ./system/configuration.nix
            home-manager.nixosModules.home-manager
            {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.titus = import ./config/home.nix;
                home-manager.extraSpecialArgs = {inherit inputs self user;};
            }
        ];
    };
}
