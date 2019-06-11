{ pkgs ? import <nixpkgs> {} }:

with pkgs; mkShell {
  buildInputs = [ nixops ];
}
