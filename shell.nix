{ pkgs ? import (fetchTarball {
  url = "https://github.com/NixOS/nixpkgs-channels/archive/06602f4bc76e46fe25e4c6e6e3db3f62714451d7.tar.gz";
  sha256 = "0a2pqnfk6m5ys2z47n463f86kqzk1g4527vib8fj9yagir4c1ph4";
}) {} }:

with pkgs; mkShell {
  buildInputs = [
    nixops
    nodePackages.node2nix
    nodejs-10_x
    postgresql
  ];
  shellHook = ''
    export PGDATA="$PWD/.postgres/data"
    export PGDATABASE="backend"
    export PGHOST="$PWD/.postgres/socket"

    export BACKEND_DATABASE_URL="postgresql:///$PGDATABASE?host=$PGHOST"

    if [ ! -d $PGDATA ]; then
      pg_ctl init
    fi

    if [ ! -d $PGHOST ]; then
      mkdir -p $PGHOST
    fi

    pg_ctl start -o "-c listen_addresses= -c unix_socket_directories=$PGHOST"
  '';
}
