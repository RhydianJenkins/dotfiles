{pkgs, inputs, ...}: let
    username = "rhydian";
in {
    home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = "23.11";

        packages = with pkgs; [
            brave
            cargo
            codespell
            gnumake
            go
            lazygit
            neovim
            nodejs_22
            pass
            tldr
            unzip
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
    home.file.".zshrc".source = ../../dotfiles/.zshrc;
    home.file.".config/i3".source = ../../i3;
    home.file.".config/nvim".source = ../../nvim;

    services.gpg-agent.enable = true;

    programs.home-manager.enable = true;

    programs.wezterm = {
        enable = true;
        extraConfig = builtins.readFile ../../dotfiles/.wezterm.lua;
    };
}
