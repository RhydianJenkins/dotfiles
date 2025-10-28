{ config, pkgs, ... }:

{
    programs.waybar = {
        enable = true;

        settings = {
            mainBar = {
                layer = "top";
                position = "top";
                height = 30;
                output = [ "eDP-1" "DP-1" ];

                modules-left = [  ];
                modules-center = [ "hyprland/workspaces" ];
                modules-right = [ ];

                "hyprland/workspaces" = {
                    all-outputs = true;  # show on all outputs
                    show-all = true;      # show empty workspaces
                };
            };
        };
    };
}
