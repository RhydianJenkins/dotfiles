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

  # make .config/nvim directory writable for vim.pack lockfile
  home.file.".config/nvim/after".source = ../../../nvim/after;
  home.file.".config/nvim/init.lua".source = ../../../nvim/init.lua;
  home.file.".config/nvim/lua".source = ../../../nvim/lua;
  home.file.".vimrc".source = ../../../dotfiles/.vimrc;

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.neovim = {
    enable = true;
    package = pkgs.unstable.neovim-unwrapped;
    viAlias = false;
    vimAlias = false;
    withNodeJs = true;
    withPython3 = true;
  };
}
