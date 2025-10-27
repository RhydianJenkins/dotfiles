{ pkgs, lib, ... }:

{
    home.packages = with pkgs; [
        wezterm
    ];

    home.file = {
        ".tmux.conf".source = ../../../dotfiles/.tmux.conf;
        ".tmuxifier".source = ../../../dotfiles/.tmuxifier;
        ".aliases".source = ../../../dotfiles/.aliases;
        ".functions".source = ../../../dotfiles/.functions;
        ".inputrc".source = ../../../dotfiles/.inputrc;
    };

    programs.wezterm = {
        enable = true;
        extraConfig = builtins.readFile ../../../dotfiles/.wezterm.lua;
    };

    programs.zsh = {
        enable = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;

        # initContent = lib.mkOrder 550 ''
        initContent = ''
            source ${builtins.toString ../../../dotfiles/.zshrc}
            source ~/.aliases
            source ~/.functions
        '';
    };
}
