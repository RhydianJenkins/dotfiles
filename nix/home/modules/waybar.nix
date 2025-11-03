{ config, pkgs, ... }:

{
    imports = [
        ./dunst.nix
    ];

    programs.waybar = {
        enable = true;
        systemd.enable = true;

        settings = {
            mainBar = {
                output = [
                    "eDP-1"
                ];

                layer = "top";
                position = "bottom";
                interval = 5;

                modules-left = [ "network" "disk" "battery" "cpu" "pulseaudio" ];
                modules-center = [ "hyprland/workspaces" ];
                modules-right = [ "clock" ];

                "hyprland/workspaces" = {
                    format = "{icon}";
                    sort-by-number = true;
                    on-click = "activate";
                    all-outputs = true;
                };

                "network" = {
                    format-wifi = "   {ipaddr}";
                    format-ethernet = "   {ipaddr}";
                    format-disconnected = "";
                    tooltip = false;
                };

                "disk" = {
                    path = "/";
                    format = "󰋊   {free}";
                };

                "cpu" = {
                    format = "   {usage}%";
                    interval = 5;
                };

                "battery" = {
                    states = {
                        warning = 30;
                        critical = 15;
                    };

                    events = {
                        on-discharging-warning = "dunstify -u normal 'Low Battery'";
                        on-discharging-critical = "dunstify -u critical 'Very Low Battery'";
                        on-charging-100 = "dunstify 'Battery Full'";
                    };

                    interval = 10;
                    format = "{icon}    {capacity}%";
                    format-icons = ["" "" "" "" ""];
                    max-length = 25;
                };

                "pulseaudio" = {
                    format = ":    {volume}%";
                    format-muted = ":  {volume}% (muted)";
                    scroll-step = 1;
                    on-click = "pavucontrol";
                };

                "clock" = {
                    format = "{:%d/%m %H:%M:%S}";
                    interval = 1;
                };
            };
        };

        style = ''
            * {
                font-family: "JetBrainsMono Nerd Font";
                font-size: 12px;
                color: #cdd6f4;
            }

            window#waybar {
                background: rgba(30, 30, 46, 0.9);
                border-radius: 10px;
                padding: 6px 10px;
            }

            #network,
            #disk,
            #memory,
            #battery,
            #cpu,
            #pulseaudio,
            #clock {
                background: #313244;
                padding: 4px 10px;
                border-radius: 8px;
                margin: 0 3px;
            }

            #network.disconnected {
                color: #f38ba8;
            }

            #battery.warning {
                color: #fab387;
            }

            #battery.critical {
                color: #f38ba8;
            }

            #pulseaudio.muted {
                color: #a6adc8;
            }

            #clock {
                background: #45475a;
            }

            #cpu {
                color: #89b4fa;
            }

            #memory {
                color: #f9e2af;
            }

            #disk {
                color: #a6e3a1;
            }

            #network {
                color: #94e2d5;
            }

            #battery {
                color: #f38ba8;
            }

            #workspaces {
                background: transparent;
                margin: 0 6px;
            }

            #workspaces button {
                padding: 4px 10px;
                margin: 2px 3px;
                border-radius: 8px;
                background: #313244;
                color: #cdd6f4;
                transition: all 0.2s ease;
                font-weight: 500;
            }

            #workspaces button:hover {
                background: #45475a;
                color: #f5e0dc;
            }

            #workspaces button.active {
                background: #89b4fa;
                color: #1e1e2e;
                font-weight: 600;
                box-shadow: 0 0 6px #89b4fa;
            }

            #workspaces button.urgent {
                background: #f38ba8;
                color: #1e1e2e;
            }
        '';
    };
}
