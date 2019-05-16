{ pkgs ? import <nixpkgs> {} }:

with pkgs; stdenv.mkDerivation {
  name = "blog-api";
  buildInputs = [
    nodePackages.node2nix
    nodejs-10_x
  ];
}
