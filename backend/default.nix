{ pkgs ? import <nixpkgs> {} }:

let
  package = builtins.fromJSON (builtins.readFile ./package.json);
in with pkgs; stdenv.mkDerivation {
  name = "${package.name}-${package.version}";
  version = "${package.version}";
  src = ./.;
  buildInputs = [ nodejs-10_x ];
  installPhase = ''
    rm -r node_modules
    echo "--------------------"
    echo $PWD
    ls -al
    npm install
    echo "--------------------"
  '';
}
