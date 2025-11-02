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
      chosen=$(printf "    Lock\n     Logout\n⏾   Suspend\n  Reboot\n   Shutdown" \
        | wofi -i --dmenu --prompt "Power" --width 200 --height 200)

      case "$chosen" in
          " Lock") hyprlock ;;
          " Logout") hyprctl dispatch exit ;;
          "⏾ Suspend") systemctl suspend ;;
          " Reboot") systemctl reboot ;;
          " Shutdown") systemctl poweroff ;;
      esac
        '';
        executable = true;
    };
}
