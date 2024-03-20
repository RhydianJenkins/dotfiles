{pkgs, ...}: let
  username = "rhydian";
in {
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";

    packages = with pkgs; [
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

  services.gpg-agent.enable = true;
}
