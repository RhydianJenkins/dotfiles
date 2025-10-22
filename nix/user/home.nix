{pkgs, customPkgs, inputs, ...}: let
    username = "rhydian";
    allPkgs = pkgs // customPkgs;
    gcloud = pkgs.google-cloud-sdk.withExtraComponents [ pkgs.google-cloud-sdk.components.gke-gcloud-auth-plugin ];
in {
    imports = [
        ./browsers.nix
        ./editors.nix
    ];

    home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = "23.11";
        sessionVariables = {
            EDITOR = "nvim";
            VISUAL = "nvim";
            BROWSER = "vivaldi";
        };
        packages = with allPkgs; [
            alsa-utils
            apix
            blueman
            brave
            cargo
            codespell
            curl
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
            git
            gnumake
            gnupg
            go
            haskellPackages.greenclip
            htop
            imagemagick
            jq
            kail
            kbfs
            keybase
            keybase-gui
            killall
            kubectl
            kubectx
            lazydocker
            lazygit
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
            tmux
            triton-llvm
            typescript
            unzip
            vim
            warp-terminal
            wezterm
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
        file.".tmux.conf".source = ../../dotfiles/.tmux.conf;
        file.".tmuxifier".source = ../../dotfiles/.tmuxifier;
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
    services.keybase.enable = true;
    services.kbfs.enable = true;

    programs.home-manager.enable = true;
    programs.wezterm = {
        enable = true;
        extraConfig = builtins.readFile ../../dotfiles/.wezterm.lua;
    };
    programs.git = {
        enable = true;
        userName = "Rhydian Jenkins";
        userEmail = "rhydz@msn.com";
        aliases = {
            stash = "stash --all";
            who = "blame -w -M -C -C -C";
        };
        maintenance = {
            enable = true;
        };
        diff-so-fancy = {
            enable = true;
        };
    };
    programs.nix-index-database.comma.enable = true;

    nixpkgs.config.allowUnfree = true;
}
