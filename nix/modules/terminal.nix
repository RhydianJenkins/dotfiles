{ pkgs, ... }:

{
    home.packages = with pkgs; [
        wezterm
        tmux
    ];

    home.file.".tmux.conf".source = ../../dotfiles/.tmux.conf;
    home.file.".tmuxifier".source = ../../dotfiles/.tmuxifier;

    programs.wezterm = {
        enable = true;
        extraConfig = builtins.readFile ../../dotfiles/.wezterm.lua;
    };
}
