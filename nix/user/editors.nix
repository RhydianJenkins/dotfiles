{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        ripgrep
        fd
        luarocks
        luajit
        tree-sitter
        rPackages.treesitter
        python3Full
        julia
        openjdk
        php84
        php84Packages.composer
    ];

    programs.neovim = {
        enable = true;
        viAlias = false;
        vimAlias = false;
        withNodeJs = true;
        withPython3 = true;
    };

    home.file.".config/nvim".source = ../../nvim;
}
