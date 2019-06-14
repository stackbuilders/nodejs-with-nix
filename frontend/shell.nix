{ pkgs ? import <nixpkgs> {} }:

with pkgs; mkShell {
  buildInputs = [
    nodePackages_10_x.node2nix
    nodejs-10_x
  ];
}
