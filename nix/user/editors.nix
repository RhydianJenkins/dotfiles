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
            viAlias = true;  # Create 'vi' command that points to nvim
            vimAlias = true; # Create 'vim' command that points to nvim
        };
    };

    home.file.".config/nvim".source = ../../nvim;
}