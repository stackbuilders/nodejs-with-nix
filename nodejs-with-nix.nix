{
  webserver = { pkgs, ... }:
  let 
    backend = import ./backend {};
    frontend = import ./frontend {};
  in {
    networking.firewall.allowedTCPPorts = [ 80 ];

    services.nginx = {
      enable = true;
      virtualHosts."default" = {
        locations = {
          "/" = {
            root = "${frontend.package}/lib/node_modules/frontend/public";
          };

          "/api/" = {
            proxyPass = "http://localhost:3000/";
          };
        };
      };
    };

    systemd.services.backend = {
      enable = true;
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
