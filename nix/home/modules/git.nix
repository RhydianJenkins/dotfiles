{ pkgs, ... }: let
    username = "Rhydian Jenkins";
    email = "rhydz@mens.com";
in {
    home.packages = with pkgs; [
        git
        lazygit
    ];

    programs.git = {
        enable = true;
        settings = {
            user = {
                name = "${username}";
                email = "${email}";
            };
            aliases = {
                stash = "stash --all";
                who = "blame -w -M -C -C -C";
            };
        };
        maintenance = {
            enable = true;
        };
    };
}
