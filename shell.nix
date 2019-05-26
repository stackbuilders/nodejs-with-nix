{ pkgs ? import <nixpkgs> {} }:

with pkgs; mkShell {
  buildInputs = [
    nodePackages.node2nix
    nodejs-10_x
  ];
}
