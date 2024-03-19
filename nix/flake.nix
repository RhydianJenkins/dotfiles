{
    description = "Rhydian's configuration flake";

    inputs = {
        nixpkgs = {
            url = "github:NixOS/nixpkgs/nixos-20.03";
        };
    };

    outputs = { self, nixpkgs }: {
        packages.x86_64-linux.default = with import nixpkgs { system = "x86_64-linux"; };
        stdenv.mkDerivation {
            name = "hello";
            src = self;
            buildPhase = "gcc -o hello ./hello.c";
            installPhase = "mkdir -p $out/bin; install -t $out/bin hello";
        };
    };
}
