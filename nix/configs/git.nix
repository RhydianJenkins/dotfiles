{ config, pkgs, ... }: let
    username = "Rhydian Jenkins";
    email = "rhydz@mens.com";
in {
    home.packages = with pkgs; [
        git
        lazygit
    ];

    programs.git = {
        enable = true;
        userName = "${username}";
        userEmail = "${email}";
        aliases = {
            stash = "stash --all";
            who = "blame -w -M -C -C -C";
        };
        maintenance = {
            enable = true;
        };
        diff-so-fancy = {
            enable = true;
        };
    };
}
