{ config, pkgs, ... }:

let 
  backend = (import ../backend {}).package.override {
    postInstall = ''
      npm run build
    '';
  };
  frontend = (import ../frontend {}).package.override {
    postInstall = ''
      export REACT_APP_CLIENT_BASE_URL="http://${config.networking.privateIPv4}/api"
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
          tryFiles = "$uri /index.html";
        };
        "/api/" = {
          proxyPass = "http://localhost:3000/";
        };
      };
    };
  };

  systemd.services.backend = {
    enable = true;
    environment = {
      DATABASE_URL = "postgres://root@dbserver/backend";
    };
    serviceConfig = {
      WorkingDirectory = "${backend}/lib/node_modules/backend";
      ExecStartPre = "${pkgs.nodejs-10_x}/bin/npx sequelize db:migrate";
      ExecStart = "${pkgs.nodejs-10_x}/bin/node ./dist/server.js";
    };
    wantedBy = [ "multi-user.target" ];
  };
}
