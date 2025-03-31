{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        neovim
        ripgrep
        fd
    ];

    home.file.".config/nvim".source = ../../nvim;
}
