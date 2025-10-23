{ pkgs, stdenv, fetchurl, appimageTools }: let
    pname = "stoplight-studio";
    version = "2.10.0";

    src = fetchurl {
        url = "https://github.com/stoplightio/studio/releases/download/v${version}-stable.9587.git-0533c10/stoplight-studio-linux-x86_64.AppImage";
        sha256 = "pCUosO1DpGsJFc1CnkFoJDuYZzmJDSfBtbtmEABGpYU="; # You'll need to get the correct hash
    };
in
    appimageTools.wrapType2 {
        inherit pname version src;

        extraInstallCommands = ''
mv $out/bin/${pname} $out/bin/stoplight
        '';

        meta = with pkgs.lib; {
            description = "Stoplight Studio – OpenAPI (OAS) visual editor";
            homepage = "https://stoplight.io/studio/";
            license = licenses.unfreeRedistributable;
            platforms = platforms.linux;
            maintainers = with maintainers; [];
        };
    }
