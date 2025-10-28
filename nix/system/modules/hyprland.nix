{ pkgs, ... }:

{
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };

    environment.sessionVariables = {
        XDG_SESSION_TYPE = "wayland";
        NIXOS_OZONE_WL = "1";
        XDG_CURRENT_DESKTOP = "X-NIXOS-SYSTEMD-AWARE";
    };

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
