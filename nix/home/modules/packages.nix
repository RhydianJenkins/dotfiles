{ pkgs, ... }:
let
  gcloud = pkgs.google-cloud-sdk.withExtraComponents [
    pkgs.google-cloud-sdk.components.gke-gcloud-auth-plugin
  ];
in
{
  home.packages = with pkgs; [
    alsa-utils
    apix
    beekeeper-studio
    blueman
    buf
    claude-code
    curl
    delve
    dig
    docker
    evans
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
    gotestsum
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
    kubefwd
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
    openssl
    pass
    pavucontrol
    pgcli
    playwright-test
    pngquant
    postman
    pulseaudioFull
    python315
    rtk
    rustup
    slack
    spotify
    sqlc
    stern
    strongbox
    tcpdump
    tealdeer
    terraform
    typescript
    typescript-language-server
    unixtools.netstat
    unstable.opencode
    unstable.opencode-claude-auth
    unzip
    vim
    wget
    whatsapp-electron
    wireshark
    wiresteward
    yarn
    yq-go
  ];

  # nix-shell -p uses the global nixpkgs config, not Home Manager settings
  home.file.".config/nixpkgs/config.nix".text = ''
    { allowUnfree = true; }
  '';

  nixpkgs.config.allowUnfree = true;
}
