{ pkgs, lib, ... }:

{
    home.packages = with pkgs; [
        wezterm
        fzf-zsh
    ];

    home.file = {
        ".aliases".source = ../../../dotfiles/.aliases;
        ".functions".source = ../../../dotfiles/.functions;
        ".inputrc".source = ../../../dotfiles/.inputrc;
        ".tmux.conf".source = ../../../dotfiles/.tmux.conf;
        ".tmuxifier".source = ../../../dotfiles/.tmuxifier;
    };

    programs.wezterm = {
        enable = true;
        extraConfig = builtins.readFile ../../../dotfiles/.wezterm.lua;
    };

    home.shell.enableZshIntegration = true;

    programs.zsh = {
        enable = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;

        initContent = builtins.readFile ../../../dotfiles/.zshrc;

        oh-my-zsh = {
            enable = true;
            theme = "gallois";
        };
    };
}
