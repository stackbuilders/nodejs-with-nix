{ pkgs ? import <nixpkgs> {} }:

with pkgs; stdenv.mkDerivation {
  name = (builtins.fromJSON (builtins.readFile ./package.json)).name;
  buildInputs = [
    nodePackages.node2nix
    nodejs-10_x
  ];
}
