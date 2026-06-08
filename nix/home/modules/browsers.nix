{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    google-chrome
    playwright-mcp
    vivaldi
  ];

  home.sessionVariables = {
    BROWSER = "vivaldi";
  };

  programs = {
    chromium.enable = true;
    firefox.enable = true;
    firefox.configPath = "${config.xdg.configHome}/mozilla/firefox";
  };
}
