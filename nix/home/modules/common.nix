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

    # nix-shell -p uses the global nixpkgs config, not Home Manager settings
    file.".config/nixpkgs/config.nix".text = ''
      { allowUnfree = true; }
    '';
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    pinentry.package = pkgs.pinentry-all;
  };

  programs.home-manager.enable = true;
  programs.nix-index-database.comma.enable = true;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "beekeeper-studio-5.3.4"
  ];
}
