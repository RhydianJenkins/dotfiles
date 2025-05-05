{pkgs, customPkgs, inputs, ...}: let
    username = "rhydian";
    allPkgs = pkgs // customPkgs;
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
            blueman
            brave
            cargo
            codespell
            curl
            customTableplus
            docker
            fd
            feh
            fzf-zsh
            gcc
            git
            gnumake
            gnupg
            go
            google-cloud-sdk
            haskellPackages.greenclip
            imagemagick
            kail
            kbfs
            keybase
            keybase-gui
            kubectl
            kubectx
            lazydocker
            lazygit
            libreoffice-qt6-fresh
            nautilus
            neofetch
            nodejs_22
            pass
            pavucontrol
            pngquant
            ripgrep
            rofi
            slack
            spotify
            tldr
            tmux
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
        pinentryPackage = pkgs.pinentry-all;
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
