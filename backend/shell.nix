{ pkgs ? import <nixpkgs> {} }:

with pkgs; mkShell {
  buildInputs = [ nodejs-10_x ];
}
