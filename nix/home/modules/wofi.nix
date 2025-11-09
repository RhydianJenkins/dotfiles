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

      chosen=$(printf "Lock\nLogout\nSuspend\nReboot\nShutdown" \
        | wofi -i --dmenu --prompt "Power" --width 200 --height 200)

      case "$chosen" in
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
          "Shutdown")
              echo "Executing: systemctl poweroff"
              systemctl poweroff
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
