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
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nix-index-database,
      apix,
      seek,
      nixos-hardware,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [ (import ./home/customPkgs { inherit apix seek system nixpkgs-unstable; }) ];
      };

      commonHmModules = [
        ./home/modules/ai.nix
        ./home/modules/browsers.nix
        ./home/modules/common.nix
        ./home/modules/terminal.nix
        nix-index-database.homeModules.nix-index
      ];
    in
    {
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
