{ pkgs, ... }:

{
  services.postgresql = {
    enable = true;
    initialScript = pkgs.writeText "initial-script" ''
      CREATE DATABASE backend;
    '';
  };
}
