{ pkgs, ... }:

{
  networking.firewall.allowedTCPPorts = [ 5432 ];

  services.postgresql = {
    enable = true;
    enableTCPIP = true;
    package = pkgs.postgresql_11;
    authentication = ''
      host backend root 192.168.56.1/24 trust
    '';
    initialScript = pkgs.writeText "initial-script"  ''
      CREATE ROLE root WITH LOGIN;
      CREATE DATABASE backend;
      GRANT ALL PRIVILEGES ON DATABASE backend TO root;
    '';
  };
}
