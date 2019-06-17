{ pkgs, ... }:

{
  networking.firewall.allowedTCPPorts = [ 5432 ];

  services.postgresql = {
    enable = true;
    enableTCPIP = true;
    package = pkgs.postgresql_11;
    authentication = ''
      host backend postgres 192.168.56.1/32 trust
      host backend postgres 192.168.56.102/32 trust
    '';
  };
}
