{ config, pkgs, ... }:

{
    imports = [
        ../system/editors.nix
    ];

    home.packages = with pkgs; [
        alacritty
        rofi
        feh
        tmux
        ripgrep
        fd
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