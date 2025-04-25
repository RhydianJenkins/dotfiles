{pkgs, customPkgs, inputs, ...}: let
    username = "rhydian";
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
        packages = [
            customPkgs.customTableplus
            pkgs.brave
            pkgs.cargo
            pkgs.codespell
            pkgs.git
            pkgs.gnumake
            pkgs.go
            pkgs.google-cloud-sdk
            pkgs.imagemagick
            pkgs.kail
            pkgs.kbfs
            pkgs.keybase
            pkgs.keybase-gui
            pkgs.kubectl
            pkgs.kubectx
            pkgs.lazydocker
            pkgs.lazygit
            pkgs.libreoffice-qt6-fresh
            pkgs.nautilus
            pkgs.nodejs_22
            pkgs.pass
            pkgs.pngquant
            pkgs.slack
            pkgs.spotify
            pkgs.tldr
            pkgs.typescript
            pkgs.unzip
            pkgs.warp-terminal
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
