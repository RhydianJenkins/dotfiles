{ pkgs, lib, ... }:

{
    imports = [
        ./editors.nix
        ./git.nix
    ];

    home.packages = with pkgs; [
        fzf
        thefuck
        tmux
        wezterm
    ];

    home.file = {
        ".aliases".source = ../../../dotfiles/.aliases;
        ".functions".source = ../../../dotfiles/.functions;
        ".inputrc".source = ../../../dotfiles/.inputrc;
        ".tmux.conf".source = ../../../dotfiles/.tmux.conf;
        ".tmuxifier".source = ../../../dotfiles/.tmuxifier;
    };

    home.shell.enableZshIntegration = true;

    programs.wezterm = {
        enable = true;
        extraConfig = builtins.readFile ../../../dotfiles/.wezterm.lua;
    };

    programs.zsh = {
        enable = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;

        initContent = builtins.readFile ../../../dotfiles/.zshrc;

        oh-my-zsh = {
            enable = true;
            theme = "gallois";

            plugins = [
                "fzf"
                "z"
                "sudo"
                "colored-man-pages"
                "command-not-found"
                "aliases"
                "extract"
                "kubectl"
                "thefuck"
                "tmux"
            ];
        };
    };
}
