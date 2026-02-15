{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    wl-clipboard
    wofi-pass
  ];

  services.cliphist = {
    enable = true;
    allowImages = true;
  };

  systemd.user.services = {
    cliphist = {
      Unit.After = [ "graphical-session.target" ];
      Service = {
        Restart = "on-failure";
        RestartSec = 2;
        StartLimitBurst = 10;
        StartLimitIntervalSec = 30;
      };
    };
    cliphist-images = {
      Unit.After = [ "graphical-session.target" ];
      Service = {
        Restart = "on-failure";
        RestartSec = 2;
        StartLimitBurst = 10;
        StartLimitIntervalSec = 30;
      };
    };
  };

  programs.wofi = {
    enable = true;

    settings = {
      allow_markup = true;
      key_up = "Ctrl-p";
      key_down = "Ctrl-n";
    };
  };

  home.file.".local/bin/wofi-power" = {
    text = ''
      #!/usr/bin/env bash

      chosen=$(printf "Shutdown\nLock\nLogout\nSuspend\nReboot" \
        | wofi -i --dmenu --prompt "Power" --width 200 --height 200)

      case "$chosen" in
          "Shutdown")
              echo "Executing: systemctl poweroff"
              systemctl poweroff
              ;;
          "Lock")
              echo "Executing: hyprlock"
              hyprlock
              ;;
          "Logout")
              echo "Executing: hyprctl dispatch exit"
              hyprctl dispatch exit
              ;;
          "Suspend")
              echo "Executing: systemctl suspend"
              systemctl suspend
              ;;
          "Reboot")
              echo "Executing: systemctl reboot"
              systemctl reboot
              ;;
          *)
              echo "Unknown selection: [$chosen]"
              exit 1
              ;;
      esac
    '';
    executable = true;
  };
}
