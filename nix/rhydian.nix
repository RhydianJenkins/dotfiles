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
}
