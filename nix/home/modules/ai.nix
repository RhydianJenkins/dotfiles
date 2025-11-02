{ config, customPkgs, ... }:

{
    home.packages = with customPkgs; [
        customOpencode
    ];

    # home.file.".config/opencode/config.json".source = ../../../dotfiles/.config/opencode/config.json;
}
