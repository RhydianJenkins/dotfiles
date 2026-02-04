{ pkgs, customPkgs, ... }:
let
  username = "rhydian";
  gcloud = pkgs.google-cloud-sdk.withExtraComponents [
    pkgs.google-cloud-sdk.components.gke-gcloud-auth-plugin
  ];
in
{
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";
    packages = with pkgs; [
      alsa-utils
      apix
      beekeeper-studio
      blueman
      cargo
      claude-code
      codespell
      curl
      customStoplight
      delve
      dig
      docker
      fd
      feh
      file
      gcc
      gcloud
      gh
      gnumake
      gnupg
      go
      haskellPackages.greenclip
      htop
      imagemagick
      jq
      kail
      killall
      kubectl
      kubectx
      lazydocker
      libreoffice-qt6-fresh
      nautilus
      neofetch
      ngrok
      nixfmt-tree
      nodejs_22
      openapi-tui
      opencode
      openssl
      pass
      pavucontrol
      peek
      playwright-test
      pngquant
      pulseaudioFull
      ripgrep
      seek
      slack
      spotify
      tealdeer
      triton-llvm
      typescript
      unstable.ollama-cuda
      unstable.tableplus
      unzip
      vim
      warp-terminal
      wget
      whatsapp-electron
      wireshark
      yq-go
    ];

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
    pinentry.package = pkgs.pinentry-all;
  };

  programs.home-manager.enable = true;
  programs.nix-index-database.comma.enable = true;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "beekeeper-studio-5.3.4"
  ];
}
