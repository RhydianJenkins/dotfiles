{ pkgs, ... }:

{
    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
        dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
        gamescopeSession.enable = true; # Helps with upscaling
    };

    home = {
        packages = with pkgs; [
            # run `protonup` to generate the compatibility report,
            # then set the protonup version in steam to use it
            protonup
        ];

        sessionVariables = {
            STEAM_EXTRA_COMPAT_TOOLS_PATH = "\${HOME}/.steam/root/compatibilitytools.d";
        };
    };

}
