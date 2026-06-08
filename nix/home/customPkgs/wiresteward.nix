{ fetchurl, lib, stdenv }:

stdenv.mkDerivation rec {
  pname = "wiresteward";
  version = "0.3.4";

  src = fetchurl {
    url = "https://github.com/utilitywarehouse/wiresteward/releases/download/v${version}/wiresteward_${version}_linux_amd64";
    hash = "sha256-JKIDLwphAGGODjG2Ngs/4yKTpFdOV2MrGy7eDiWTYxk=";
  };

  dontUnpack = true;
  dontBuild = true;

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/wiresteward
    chmod +x $out/bin/wiresteward
  '';

  meta = {
    description = "WireGuard peer manager with OAuth2 authentication";
    homepage = "https://github.com/utilitywarehouse/wiresteward";
    license = lib.licenses.mit;
    mainProgram = "wiresteward";
    platforms = [ "x86_64-linux" ];
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
  };
}
