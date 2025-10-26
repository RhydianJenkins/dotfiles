{ config, pkgs, ... }: let
    username = "Rhydian Jenkins";
    email = "rhydz@mens.com";
in {
    home.packages = with pkgs; [
        kbfs
        keybase
        keybase-gui
    ];

    services.keybase.enable = true;
    services.kbfs.enable = true;
}
