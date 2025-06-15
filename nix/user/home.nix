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
            blueman
            brave
            cargo
            codespell
            curl
            customTableplus
            dig
            docker
            fd
            feh
            file
            gcc
            gcloud
            git
            gnumake
            gnupg
            go
            haskellPackages.greenclip
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
            openssl
            pass
            pavucontrol
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
    };

    nixpkgs.config.allowUnfree = true;
}
