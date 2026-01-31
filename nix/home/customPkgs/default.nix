{
  apix,
  pkgs-unstable,
  seek,
  system,
}:
final: prev: {
  apix = apix.packages.${system}.default;
  customStoplight = final.callPackage ./stoplight.nix { };
  seek = seek.packages.${system}.default;
  unstable = pkgs-unstable;
}
