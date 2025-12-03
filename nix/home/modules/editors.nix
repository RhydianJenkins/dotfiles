{ pkgs, ... }:

{
    home.packages = with pkgs; [
        ripgrep
        fd
        luarocks
        luajit
        tree-sitter
        rPackages.treesitter
        julia
        openjdk
        php84
        php84Packages.composer
    ];

    home.file.".vimrc".source = ../../../dotfiles/.vimrc;
    home.file.".config/nvim".source = ../../../nvim;

    home.sessionVariables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
    };

    programs.neovim = {
        enable = true;
        viAlias = false;
        vimAlias = false;
        withNodeJs = true;
        withPython3 = true;
    };
}
