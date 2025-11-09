{ pkgs, stdenv, fetchurl, lib, makeWrapper, autoPatchelfHook }:

stdenv.mkDerivation rec {
    pname = "opencode";
    version = "1.0.51";

    src = fetchurl {
        url = "https://github.com/sst/opencode/releases/download/v${version}/opencode-linux-x64.zip";
        sha256 = "0sl93wswg6pn07j0q0zc3xnp6xrl9kvra063k2lr0jkj89srvfzx";
    };

    nativeBuildInputs = [
        pkgs.unzip
        makeWrapper
        autoPatchelfHook
    ];

    buildInputs = with pkgs; [
        stdenv.cc.cc.lib
        ncurses
    ];

    unpackPhase = ''
        unzip $src
    '';

    installPhase = ''
        mkdir -p $out/bin
        cp -r * $out/
        makeWrapper $out/opencode $out/bin/opencode --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath [ stdenv.cc.cc.lib pkgs.ncurses ]}"
    '';

    meta = with lib; {
        description = "Opencode - A command line tool for interacting with AI agents";
        homepage = "https://opencode.ai";
        license = licenses.mit;
        platforms = platforms.linux;
        maintainers = [ ];
    };
}
