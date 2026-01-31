{
  apix,
  nixpkgs-unstable,
  seek,
  system,
}:
final: prev: {
  apix = apix.packages.${system}.default;
  customOpencode = final.callPackage ./opencode.nix { };
  customStoplight = final.callPackage ./stoplight.nix { };
  customTableplus = final.callPackage ./tableplus.nix { };
  seek = seek.packages.${system}.default;
  unstable = nixpkgs-unstable.legacyPackages.${system};
}
