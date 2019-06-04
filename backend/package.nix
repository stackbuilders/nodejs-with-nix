{ pkgs ? import <nixpkgs> {} }:

let
  package = builtins.fromJSON (builtins.readFile ./package.json);
in with pkgs; stdenv.mkDerivation {
  pname = "${package.name}-package";
  version = "${package.version}";
  buildInputs = [ nodejs-10_x ];
  srcs = [
    ./package-lock.json
    ./package.json
  ];
  unpackPhase = ''
    cp $srcs[0] package-lock.json
    cp $srcs[1] package.json
  '';
  installPhase = ''
    export HOME=$TMPDIR
    npm install
    mkdir $out
    cp node_modules $out
  '';
}
