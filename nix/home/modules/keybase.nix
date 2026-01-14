{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kbfs
    keybase
    keybase-gui
  ];

  services.keybase.enable = true;
  services.kbfs.enable = true;
}
