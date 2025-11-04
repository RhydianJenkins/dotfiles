{ config, pkgs, ... }:

{
    imports = [
        ./wofi.nix
        ./waybar.nix
        ./hyprpaper.nix
    ];

    home.packages = with pkgs; [
        grim
        slurp
    ];

    home.pointerCursor = {
        enable = true;
        name = "Adwaita";
        package = pkgs.vanilla-dmz;
        hyprcursor.enable = true;
    };

    wayland.windowManager.hyprland = {
        enable = true;
        package = pkgs.hyprland;
        xwayland.enable = true;

        settings = {
            monitor = [ ",preferred,auto,auto" ];

            "$mod" = "ALT";

            exec-once = [
                "systemctl --user start waybar"
            ];

            input = {
                kb_layout = "gb";
                kb_options = "caps:escape";
                repeat_delay = 200;
                repeat_rate = 40;
                touchpad = {
                    natural_scroll = true;
                    tap-to-click = false;
                    clickfinger_behavior = true;
                };
            };

            general = {
                gaps_in = 1;
                gaps_out = 2;
                border_size = 2;
                "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
                "col.inactive_border" = "rgba(595959aa)";
                layout = "dwindle";
            };

            decoration = {
                rounding = 5;
                blur = {
                    enabled = true;
                    size = 3;
                    passes = 1;
                };
            };

            animations = {
                enabled = false;
            };

            dwindle = {
                pseudotile = true;
                preserve_split = true;
            };

            bind = [
                "$mod, Return, exec, wezterm"
                "$mod, space, exec, pkill wofi || wofi --show drun"
                "SUPER, V, exec, pkill wofi || cliphist list | wofi -S dmenu --pre-display-cmd \"echo '%s' | cut -f 2\" --prompt \"Clipboard History\" | cliphist decode | wl-copy"
                "$mod SHIFT, Q, killactive"
                "$mod SHIFT, Space, togglefloating"
                "$mod SHIFT, S, exec, grim -g \"$(slurp)\" - | wl-copy"
                "$mod, P, exec, pkill wofi || wofi-pass -sic"
                "$mod, BACKSPACE, exec, ~/.local/bin/wofi-power"

                # Move focus with hjkl
                "$mod, h, movefocus, l"
                "$mod, j, movefocus, d"
                "$mod, k, movefocus, u"
                "$mod, l, movefocus, r"

                # Switch workspaces (0-9)
                "$mod, 1, workspace, 1"
                "$mod, 2, workspace, 2"
                "$mod, 3, workspace, 3"
                "$mod, 4, workspace, 4"
                "$mod, 5, workspace, 5"
                "$mod, 6, workspace, 6"
                "$mod, 7, workspace, 7"
                "$mod, 8, workspace, 8"
                "$mod, 9, workspace, 9"
                "$mod, 0, workspace, 10"

                # Move active window to workspace (0-9)
                "$mod SHIFT, 1, movetoworkspace, 1"
                "$mod SHIFT, 2, movetoworkspace, 2"
                "$mod SHIFT, 3, movetoworkspace, 3"
                "$mod SHIFT, 4, movetoworkspace, 4"
                "$mod SHIFT, 5, movetoworkspace, 5"
                "$mod SHIFT, 6, movetoworkspace, 6"
                "$mod SHIFT, 7, movetoworkspace, 7"
                "$mod SHIFT, 8, movetoworkspace, 8"
                "$mod SHIFT, 9, movetoworkspace, 9"
                "$mod SHIFT, 0, movetoworkspace, 10"

                # Volume control
                ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
                ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
                ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
                ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
            ];

            bindm = [
                "$mod, mouse:272, movewindow"
                "$mod, mouse:273, resizewindow"
            ];

            bindl = [
                # bindl=,switch:off:[switch name],exec,<CMD>

                # "switch:off, exec, dunstify 'switch off'"
                # "switch:on:, exec, dunstify 'switch on'"
                # "switch:off:Lid Switch, exec, hyprctl keyword monitor \"eDP-1,disable\""
                # "switch:on:Lid Switch, exec, hyprctl keyword monitor \"eDP-1,preferred,auto,1\""
            ];
        };
    };
}
