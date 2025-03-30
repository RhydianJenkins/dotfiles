{ config, pkgs, ... }:

{
    # Personal-specific system settings
    environment.systemPackages = with pkgs; [
        # Personal applications
        spotify
        steam
        discord
        # Add more personal applications here
    ];

    # Personal-specific system settings
    services = {
        # Enable personal services
        syncthing.enable = true;
        # Add more personal services here
    };

    # Personal-specific system configurations
    programs = {
        # Personal program configurations
        steam.enable = true;
        # Add more personal program configurations here
    };
}