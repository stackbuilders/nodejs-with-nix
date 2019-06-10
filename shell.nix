{ pkgs ? import <nixpkgs> {} }:

with pkgs; mkShell {
  buildInputs = [
    nixops
    nodePackages.node2nix
    nodejs-10_x
  ];
}
