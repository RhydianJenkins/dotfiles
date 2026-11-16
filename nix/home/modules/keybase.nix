{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kbfs
    keybase
  ];

  services.keybase.enable = true;
  services.kbfs.enable = true;
}
