{
  apix,
  pkgs-unstable,
  seek,
  system,
}:
final: prev: {
  apix = apix.packages.${system}.default;
  customStoplight = final.callPackage ./stoplight.nix { };
  go_1_26_4 = prev.go.overrideAttrs (old: rec {
    version = "1.26.4";
    src = final.fetchurl {
      url = "https://dl.google.com/go/go${version}.src.tar.gz";
      hash = "sha256-T2aKMvv8ETLmqIH7lowvHa2mMUkqM5IRc1+7JVpCYC0=";
    };
  });
  seek = seek.packages.${system}.default;
  unstable = pkgs-unstable;
  wiresteward = final.callPackage ./wiresteward.nix { };
}
