{pkgs, inputs, ...}: let
    username = "rhydian";
in {
    imports = [
        ./editors.nix
        ./browsers.nix
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
        packages = with pkgs; [
            brave
            cargo
            google-clasp
            codespell
            git
            gnumake
            go
            imagemagick
            kbfs
            keybase
            keybase-gui
            lazydocker
            lazygit
            nodejs_22
            pass
            pngquant
            slack
            spotify
            spotify
            tldr
            typescript
            unzip
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
