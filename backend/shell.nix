{ pkgs ? import <nixpkgs> {} }:

with pkgs; mkShell {
  buildInputs = [
    nodejs-10_x
    postgresql_11
  ];
  shellHook = ''
    export PGDATA="$PWD/.nix-shell/postgres/data"
    export PGHOST="$PWD/.nix-shell/postgres/host"
    export PGLOG="$PWD/.nix-shell/postgres/log"

    export PGDATABASE="backend"

    export BACKEND_DATABASE_URL="postgresql:///$PGDATABASE?host=$PGHOST"

    stop() {
      if [ -f "$PGDATA/postmaster.pid" ]; then
        pg_ctl stop
      fi
    }

    if [ ! -d "$PGDATA" ]; then
      initdb --auth=trust > /dev/null
    fi

    if [ ! -d "$PGHOST" ]; then
      mkdir -p "$PGHOST"
    fi

    if [ ! -d "$PGLOG" ]; then
      mkdir -p "$PGLOG"
    fi

    pg_ctl start \
      -l "$PGLOG/logfile" \
      -o "-c listen_addresses= -c unix_socket_directories=$PGHOST"

    createdb 2> /dev/null

    trap stop EXIT
  '';
}
