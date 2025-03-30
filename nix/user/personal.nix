{ config, pkgs, ... }:

{
    imports = [
        ./editors.nix
        ./browsers.nix
    ];

    home.packages = with pkgs; [
        spotify
    ];

    programs = {
        git = {
            enable = true;
            userName = "Rhydian Jenkins";
            userEmail = "rhydz@msn.com";
        };
    };

    home.sessionVariables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
        BROWSER = "thorium";
    };
}
