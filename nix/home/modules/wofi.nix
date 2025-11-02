{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        wl-clipboard
        wofi-pass
    ];

    services.cliphist = {
        enable = true;
        allowImages = true;
    };

    programs.wofi = {
        enable = true;

        settings = {
            allow_markup = true;
            key_up = "Ctrl-p";
            key_down = "Ctrl-n";
        };
    };
}
