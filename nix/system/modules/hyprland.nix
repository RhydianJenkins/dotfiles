{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.xserver = {
    enable = true;
    autorun = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 40;
  };
}
