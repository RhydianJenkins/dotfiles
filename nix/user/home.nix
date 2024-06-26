{pkgs, ...}: let
    username = "rhydian";
in {
    home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = "23.11";

        packages = with pkgs; [
            wget
            curl
            git
            xclip
            gcc
            unzip
            python3
            nodejs_21
            wezterm
            brave
            firefox
            rofi
            neovim
            ripgrep
            tldr
            cargo
            rustup
            rustc
            lazygit
            neofetch
            fzf-zsh
            pass
            gnumake
            docker
            go
            haskellPackages.greenclip
        ];
    };

    # Install existing dotfiles
    # These will evenaually be added to the nix home-manager declaration
    home.file.".aliases".source = ../../dotfiles/.aliases;
    home.file.".bashrc".source = ../../dotfiles/.bashrc;
    home.file.".functions".source = ../../dotfiles/.functions;
    home.file.".inputrc".source = ../../dotfiles/.inputrc;
    home.file.".tmux.conf".source = ../../dotfiles/.tmux.conf;
    home.file.".tmuxifier".source = ../../dotfiles/.tmuxifier;
    home.file.".wezterm.lua".source = ../../dotfiles/.wezterm.lua;
    home.file.".zshrc".source = ../../dotfiles/.zshrc;
    home.file.".config/i3".source = ../../i3;
    # home.file.".config/nvim".source = ../../nvim;

    services.gpg-agent.enable = true;

    programs.home-manager.enable = true;
}
