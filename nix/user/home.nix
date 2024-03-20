{pkgs, ...}: let
  username = "rhydian";
in {
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";

    packages = with pkgs; [
    ];
  };

  programs = {
      zsh = {
          enable = true;
          shellAliases = {
              test = "echo 'it worked'";
              c = "clear";
              ll = "ls -la";
          };
      };
  };

  # services.gpg-agent.enable = true;
}
