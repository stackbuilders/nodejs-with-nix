{ pkgs ? import <nixpkgs> {} }:

with pkgs; stdenv.mkDerivation {
  name = (builtins.fromJSON (builtins.readFile ./package.json)).name;
  buildInputs = [
    nodePackages.node2nix
    nodejs-10_x
    postgresql
  ];
  shellHook = ''
    export PGDATA="$PWD/.postgresql/data"

    export DATABASE_URL="postgresql:///postgres"

    if [ ! -d $PGDATA ]; then
      initdb -D $PGDATA
    fi

    pg_ctl start -D $PGDATA -l .postgresql/log
  '';
}
