{ pkgs, ... }:

{
    services.hyprpaper = {
        enable = true;
        settings.ipc = "on"; # Allow scripts to call hyprpaper
    };
}
