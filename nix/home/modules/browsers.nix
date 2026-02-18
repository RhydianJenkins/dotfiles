{ pkgs, ... }:

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

    firefox = {
      enable = true;
      package = pkgs.firefox;
      profiles = {
        default = {
          id = 0;
          name = "default";
          search = {
            default = "google";
            engines = {
              "google" = {
                urls = [
                  {
                    template = "https://www.google.com/search";
                    params = [
                      {
                        name = "q";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];
                definedAliases = [ "g" ];
              };
            };
          };
        };
      };
    };
  };
}
