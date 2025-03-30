{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        neovim
        ripgrep
        fd
    ];

    programs = {
        neovim = {
            enable = true;
            package = pkgs.neovim;
            viAlias = true;
            vimAlias = true;
        };
    };

    home.file.".config/nvim".source = ../../nvim;
}
