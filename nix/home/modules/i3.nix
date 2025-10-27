{ pkgs, ... }:

{
    home.packages = with pkgs; [
        rofi
        xclip
    ];

    home.file.".config/i3".source = ../../../i3;
}
