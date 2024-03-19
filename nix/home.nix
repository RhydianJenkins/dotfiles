{pkgs, ...}: let
  username = "rhydian";
in {
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";

    packages = with pkgs; [
      firefox
      neovim
      tldr
      dmenu
      xclip
      ripgrep
      rofi
      cargo
      gcc
      neovim
      wget
      neofetch
      lazygit
    ];
  };

  programs = {
    home-manager.enable = true;

    wezterm = {
      enable = true;
      package = pkgs.wezterm;
    };

    git = {
      enable = true;
      userName = "Rhydian Jenkins";
      userEmail = "rhydz@msn.com";
    };
  };

  services = {
    gpg-agent.enable = true;
  };
}