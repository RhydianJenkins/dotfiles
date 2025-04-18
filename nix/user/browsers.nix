{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        brave
        google-chrome
        microsoft-edge
        vivaldi
    ];

    programs = {
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
    };
}
