{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        fd
        feh
        ripgrep
        rofi
        tmux
    ];

    services = {
        syncthing.enable = true;
    };

    programs = {
    };
}
