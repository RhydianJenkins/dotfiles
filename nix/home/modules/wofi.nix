{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        wl-clipboard
    ];

    services.cliphist = {
        enable = true;
        allowImages = true;
    };

    programs.wofi = {
        enable = true;

        settings = {
            allow_markup = true;
        };
    };
}
