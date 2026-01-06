{ pkgs, stdenv, fetchurl, lib, makeWrapper, autoPatchelfHook }:

stdenv.mkDerivation rec {
    pname = "opencode";
    version = "1.1.3";

    src = fetchurl {
        url = "https://github.com/anomalyco/opencode/releases/download/v${version}/opencode-linux-x64.tar.gz";
        sha256 = "10lbglamc5wivbyhajn402bm1qmz8w95kgn6jyyazbdrn1fchjp7";
    };

    nativeBuildInputs = [
        makeWrapper
        autoPatchelfHook
    ];

    buildInputs = with pkgs; [
        stdenv.cc.cc.lib
        ncurses
    ];

    unpackPhase = ''
        tar -xvzf $src
    '';

    installPhase = ''
        runHook preInstall

        mkdir -p $out/bin
        cp -r * $out/
        makeWrapper $out/opencode $out/bin/opencode --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath [ stdenv.cc.cc.lib pkgs.ncurses ]}"

        runHook postInstall
    '';

    meta = with lib; {
        description = "Opencode - A command line tool for interacting with AI agents";
        homepage = "https://opencode.ai";
        license = licenses.mit;
        platforms = platforms.linux;
        maintainers = [ ];
    };
}
