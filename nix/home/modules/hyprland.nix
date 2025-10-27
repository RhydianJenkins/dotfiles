{ config, pkgs, ... }:

{
    wayland.windowManager.hyprland = {
        enable = true;
        package = pkgs.hyprland;
        xwayland.enable = true;
        systemd.enable = true;

        settings = {
            # monitor = [ "eDP-1,preferred,auto,1" ];
            input = {
                kb_layout = "gb";
                kb_options = "caps:escape";
            };
        };
    };

    home.file.".config/hypr".source = ../../../hypr;
}
