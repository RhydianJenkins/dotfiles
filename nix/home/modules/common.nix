{ pkgs, username, ... }:

{
  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";

    file.".config/blueman/blueman.conf".text = ''
      [Plugins]
      ConnectionNotifier=false
    '';
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    pinentry.package = pkgs.pinentry-all;
  };

  programs.home-manager.enable = true;
  programs.nix-index-database.comma.enable = true;
}
