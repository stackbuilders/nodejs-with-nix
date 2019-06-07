{ ... }:

{
  services.postgresql = {
    enable = true;
    port = 5432;
    superUser = root;
    ensureDatabase = [
      "backend"
    ];
  };

  systemd.services.postgresql = {
    enable = true;
    serviceConfig = {
      ExecStart = "/usr/local/pgsql/bin/postgres -D /usr/local/pgsql/data";
      ExecReload = "/bin/kill -HUP $MAINPID"; 
      User = "postgres";
      Group = "postgres";
      Type = "notify";
      KillSignal = "SIGINT";
      KillMode = "mixed";
      TimeoutSec = 0;   
    };
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
  };
}
