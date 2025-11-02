{ pkgs, stdenv, fetchurl, lib, makeWrapper, autoPatchelfHook }:

stdenv.mkDerivation rec {
    pname = "opencode";
    version = "1.0.12";

    src = fetchurl {
        url = "https://github.com/sst/opencode/releases/download/v${version}/opencode-linux-x64.zip";
        sha256 = "DOSBtdjRkFagtgkF16kte1jUC4Gw/YeQLRg85T9+9pU=";
    };

    nativeBuildInputs = [
        pkgs.unzip
        makeWrapper
        autoPatchelfHook
    ];

    buildInputs = with pkgs; [
        stdenv.cc.cc.lib
        # Add other dependencies as needed
    ];

    unpackPhase = ''
    unzip $src
    '';

    installPhase = ''
        mkdir -p $out/bin
        cp -r * $out/

        makeWrapper $out/opencode $out/bin/opencode \
        --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath [ stdenv.cc.cc.lib ]}" \
        --run 'mkdir -p "$HOME/.local/opencode" "$HOME/.local/share/opencode/log"'
    '';

    meta = with lib; {
        description = "Opencode - A command line tool for interacting with AI agents";
        homepage = "https://opencode.ai";
        license = licenses.unfree;
        platforms = platforms.linux;
        maintainers = [ ];
    };
}
