{ pkgs, ... }:

{
    packages = with allPkgs; [
        rofi
        xclup
    ];

    home.file.".config/i3".source = ../../../i3;
}
