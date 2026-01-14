{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    autorun = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 40;

    desktopManager = {
      xterm.enable = false;
    };

    displayManager = {
      lightdm.enable = true;
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
        i3blocks
      ];
    };

    xkb = {
      layout = "gb";
      variant = "";
      options = "caps:escape";
    };
  };
}
