{
  webserver = { pkgs, ... }:
  let 
    backend = (import ./backend {}).package.override {
      postInstall = ''
        npm run build
      '';
    };
    frontend = (import ./frontend {}).package.override {
      postInstall = ''
        npm run build
      '';
    };
  in {
    networking.firewall.allowedTCPPorts = [ 80 ];

    services.nginx = {
      enable = true;
      virtualHosts."default" = {
        locations = {
          "/" = {
            root = "${frontend}/lib/node_modules/frontend/build";
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
        WorkingDirectory = "${backend}/lib/node_modules/backend/dist";
        ExecStart = "${pkgs.nodejs-10_x}/bin/node ./server.js";
      };
      wantedBy = [ "multi-user.target" ];
    };
  };

  dbserver = { ... }: {
    services.postgresql.enable = true;
  };
}
