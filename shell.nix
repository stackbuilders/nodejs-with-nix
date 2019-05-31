{ pkgs ? import (fetchTarball "https://releases.nixos.org/nixos/19.03/nixos-19.03.172765.55df3fe5f3f/nixexprs.tar.xz") {} }:

with pkgs; mkShell {
  buildInputs = [
    nodePackages.node2nix
    nodejs-10_x
  ];
}
