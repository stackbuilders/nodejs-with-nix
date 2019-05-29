{
  webserver = { pkgs, ... }:
  let 
    backend = import ./backend {};
    frontend = (import ./frontend {}).package.override {
      postInstall = ''
        echo "....."
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
        WorkingDirectory = "${backend.package}";
        ExecStart = "${pkgs.nodejs-10_x}/bin/node ./lib/node_modules/backend/bin/www";
      };
      wantedBy = [ "multi-user.target" ];
    };
  };

  dbserver = { ... }: {
    services.postgresql.enable = true;
  };
}
