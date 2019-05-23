{
  webserver = { pkgs, ... }:
  let 
    backend = import ./backend {};
  in {
    networking.firewall.allowedTCPPorts = [ 80 ];

    services.nginx = {
      enable = true;
      virtualHosts."default" = {
        locations."/" = {
          proxyPass = "http://localhost:3000";
        };
      };
    };

    systemd.services.backend = {
      serviceConfig = {
        WorkingDirectory = "${backend.package}";
        ExecStart = "${pkgs.nodejs-10_x}/bin/node ./lib/node_modules/backend/bin/www";
      };
    };
  };

  dbserver = { ... }: {
    services.postgresql.enable = true;
  };
}
