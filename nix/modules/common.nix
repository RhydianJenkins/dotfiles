{pkgs, customPkgs, ...}: let
    username = "rhydian";
    allPkgs = pkgs // customPkgs;
    gcloud = pkgs.google-cloud-sdk.withExtraComponents [ pkgs.google-cloud-sdk.components.gke-gcloud-auth-plugin ];
in {
    home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = "23.11";
        packages = with allPkgs; [
            alsa-utils
            apix
            blueman
            cargo
            codespell
            curl
            customStoplight
            customTableplus
            delve
            dig
            docker
            fd
            feh
            file
            flyctl
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
            nodejs_22
            ollama
            openapi-tui
            openssl
            pass
            pavucontrol
            peek
            playwright-test
            pngquant
            pulseaudioFull
            ripgrep
            rofi
            slack
            spotify
            tealdeer
            triton-llvm
            typescript
            unzip
            vim
            warp-terminal
            wget
            xclip
            yq-go
        ];

        # Install existing dotfiles
        # These will evenaually be added to the nix home-manager declaration
        file.".aliases".source = ../../dotfiles/.aliases;
        file.".bashrc".source = ../../dotfiles/.bashrc;
        file.".functions".source = ../../dotfiles/.functions;
        file.".inputrc".source = ../../dotfiles/.inputrc;
        file.".vimrc".source = ../../dotfiles/.vimrc;
        file.".zshrc".source = ../../dotfiles/.zshrc;
        file.".config/i3".source = ../../i3;
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
}
