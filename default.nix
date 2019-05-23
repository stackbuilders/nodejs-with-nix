{ pkgs ? import <nixpkgs> {} }:

let
  backend = import ./backend {};
  frontend = import ./frontend {};
in pkgs.stdenv.mkDerivation {
  name = "nodejs-with-nix";
}
