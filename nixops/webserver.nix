{ pkgs, ... }:

let 
  backend = (import ../backend {}).package.override {
    postInstall = ''
      npm run build
      npx sequelize db:migrate 
    '';
  };
  frontend = (import ../frontend {}).package.override {
    postInstall = ''
      export REACT_APP_CLIENT_BASE_URL="http://192.168.56.102/api"
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
    environment = {
      BACKEND_DATABASE_URL = "postgresql://192.168.56.101/backend";
    };
    serviceConfig = {
      WorkingDirectory = "${backend}/lib/node_modules/backend/dist";
      ExecStart = "${pkgs.nodejs-10_x}/bin/node ./server.js";
    };
    wantedBy = [ "multi-user.target" ];
  };
}
