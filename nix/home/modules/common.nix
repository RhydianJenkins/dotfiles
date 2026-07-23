{ pkgs, ... }:
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
      buf
      claude-code
      codespell
      curl
      customStoplight
      delve
      dig
      docker
      evans
      fd
      feh
      ffmpeg
      file
      gcc
      gcloud
      gh
      gnumake
      gnupg
      go_1_26_4
      golangci-lint
      gopls
      grpcurl
      haskellPackages.greenclip
      htop
      imagemagick
      jq
      just
      k9s
      kail
      killall
      kubectl
      kubectx
      kustomize
      lazydocker
      libreoffice-qt6-fresh
      mage
      mockgen
      nautilus
      ngrok
      nixfmt-tree
      nodejs_22
      obsidian
      openapi-tui
      openssl
      pass
      pavucontrol
      peek
      playwright-test
      pngquant
      pulseaudioFull
      python315
      ripgrep
      rustup
      seek
      slack
      spotify
      sqlc
      stern
      tcpdump
      tealdeer
      triton-llvm
      typescript
      unixtools.netstat
      unstable.opencode
      unstable.opencode-claude-auth
      unzip
      vim
      warp-terminal
      wget
      whatsapp-electron
      wireshark
      wiresteward
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
