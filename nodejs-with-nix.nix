{
  webserver = { pkgs, ... }:
  let 
    backend = import ./backend {};
  in {
    networking.firewall.allowedTCPPorts = [ 80 ];

    services.nginx = {
      enable = true;
    };

    systemd.services.backend = {
      serviceConfig = {
        ExecStart = "${pkgs.nodejs-10_x}/bin/node ${backend.package}/bin/www";
      };
    };
  };

  dbserver = { ... }: {
    services.postgresql.enable = true;
  };
}
