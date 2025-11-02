{ config, pkgs, ... }:

{
    services.dunst = {
        enable = true;

        settings = {
            urgency_low = {
                frame_color = "#3B7C87";
                foreground = "#3B7C87";
                background = "#191311";
            };

            urgency_normal = {
                frame_color = "#5B8234";
                foreground = "#5B8234";
                background = "#191311";
            };

            urgency_critical = {
                frame_color = "#B7472A";
                foreground = "#B7472A";
                background = "#191311";
            };
        };
    };
}
