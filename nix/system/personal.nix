{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        spotify
    ];

    services = {
        syncthing.enable = true;
    };

    programs = {
    };
}
