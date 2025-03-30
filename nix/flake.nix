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
        # System configurations
        nixosConfigurations = {
            # Personal system configuration
            personal = lib.nixosSystem {
                inherit system;
                modules = [
                    ./system/configuration.nix
                    ./system/personal.nix  # Personal-specific settings
                ];
            };

            # Add more system configurations here as needed
        };

        # Home configurations
        homeConfigurations = {
            # Personal home configuration
            personal = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                    ./user/home.nix
                    ./user/personal.nix  # Personal-specific home settings
                ];
            };

            # Add more home configurations here as needed
        };

        # Development shell
        devShells.${system}.default = pkgs.mkShell {
            buildInputs = with pkgs; [
                # Add development tools here
            ];
        };
    };
}
