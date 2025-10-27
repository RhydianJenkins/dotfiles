{ pkgs, ... }:

{
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };

    environment.sessionVariables = {
        XDG_SESSION_TYPE = "wayland";
        XDG_CURRENT_DESKTOP = "Hyprland";
        MOZ_ENABLE_WAYLAND = "1";
        QT_QPA_PLATFORM = "wayland";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        GDK_BACKEND = "wayland";
        NIXOS_OZONE_WL = "1";
    };

    environment.systemPackages = with pkgs; [
        waybar
        wofi
    ];

    services.displayManager = {
        enable = true;
        autoLogin.enable = true;
        autoLogin.user = "rhydian";
    };

    services.xserver = {
        enable = true;
        autorun = true;
        autoRepeatDelay = 200;
        autoRepeatInterval = 40;
    };
}
