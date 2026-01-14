{ apix, system }:
final: prev: {
  customStoplight = final.callPackage ./stoplight.nix { };
  customTableplus = final.callPackage ./tableplus.nix { };
  customOpencode = final.callPackage ./opencode.nix { };
  apix = apix.packages.${system}.default;
}
