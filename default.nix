{ pkgs ? import <nixpkgs> {} }:

{
  backend = pkgs.callPackage ./backend {};
  frontend = pkgs.callPackage ./frontend {};
}
