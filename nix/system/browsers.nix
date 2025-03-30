{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        thorium
        google-chrome
        firefox
        microsoft-edge
    ];

    programs = {
        thorium = {
            enable = true;
            package = pkgs.thorium;
        };

        firefox = {
            enable = true;
            package = pkgs.firefox;
            profiles = {
                default = {
                    id = 0;
                    name = "default";
                    search = {
                        default = "Google";
                        engines = {
                            "Google" = {
                                urls = [{
                                    template = "https://www.google.com/search";
                                    params = [
                                        { name = "q"; value = "{searchTerms}"; }
                                    ];
                                }];
                                definedAliases = [ "g" ];
                            };
                        };
                    };
                };
            };
        };

        chrome = {
            enable = true;
            package = pkgs.google-chrome;
        };

        edge = {
            enable = true;
            package = pkgs.microsoft-edge;
        };
    };
}