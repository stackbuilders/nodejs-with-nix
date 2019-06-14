{ pkgs, ... }:

{
  networking.firewall.allowedTCPPorts = [ 5432 ];

  services.postgresql = {
    enable = true;
    initialScript = pkgs.writeText "initial-script" ''
      CREATE DATABASE backend;
    '';
  };
}
