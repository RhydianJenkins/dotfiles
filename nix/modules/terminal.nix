{ pkgs, ... }:

{
    home.packages = with pkgs; [
        wezterm
        tmux
    ];

    home.file.".tmux.conf".source = ../../dotfiles/.tmux.conf;
    home.file.".tmuxifier".source = ../../dotfiles/.tmuxifier;
    home.file.".zshrc".source = ../../dotfiles/.zshrc;
    home.file.".bashrc".source = ../../dotfiles/.bashrc;
    home.file.".aliases".source = ../../dotfiles/.aliases;
    home.file.".functions".source = ../../dotfiles/.functions;
    home.file.".inputrc".source = ../../dotfiles/.inputrc;

    programs.wezterm = {
        enable = true;
        extraConfig = builtins.readFile ../../dotfiles/.wezterm.lua;
    };
}
