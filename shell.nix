{ pkgs ? import <nixpkgs> {} }:

with pkgs; stdenv.mkDerivation {
  name = "nodejs-with-nix";
  buildInputs = [
    nodePackages.node2nix
    nodejs-10_x
  ];
}
