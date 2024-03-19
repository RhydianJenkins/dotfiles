{pkgs, ...}: let
  username = "rhydian";
in {
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";

    packages = with pkgs; [
      neovim
      wget
      wezterm
      neofetch
      lazygit
    ];
  };

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      userName = "Rhydian Jenkins";
      userEmail = "rhydz@msn.com";
    };

    zsh = {
      enableAutosuggestions = true;
      shellAliases = {
        c = "clear";
        ll = "ls -la";
        lg = "lazygit";
        gs = "git status";
      };
    };
  };

  services = {
    gpg-agent.enable = true;
  };
}
