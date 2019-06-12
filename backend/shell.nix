{ pkgs ? import <nixpkgs> {} }:

with pkgs; mkShell {
  buildInputs = [
    nodejs-10_x
    postgresql_11
  ];
  shellHook = ''
    export NIX_SHELL_DIR="$PWD/.nix-shell"

    export PGDATA="$NIX_SHELL_DIR/var/lib/postgres/data"
    export PGDATABASE="backend"
    export PGHOST="$NIX_SHELL_DIR/tmp"
    export PGLOG="$NIX_SHELL_DIR/var/log/postgres"

    if [ ! -d $PGDATA ]; then
      ${pkgs.postgresql_11}/bin/initdb --auth=trust > /dev/null
    fi

    if [ ! -d $PGLOG ]; then
      mkdir -p $PGLOG
    fi

    if [ ! -d $PGHOST ]; then
      mkdir -p $PGHOST
    fi

    ${pkgs.postgresql_11}/bin/pg_ctl start -l "$PGLOG/logfile" -o "-c listen_addresses= -c unix_socket_directories=$PGHOST"

    trap "${pkgs.postgresql_11}/bin/pg_ctl stop" EXIT
  '';
}
