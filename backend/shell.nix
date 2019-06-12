{ pkgs ? import <nixpkgs> {} }:

with pkgs; mkShell {
  buildInputs = [
    nodejs-10_x
    postgresql_11
  ];
  shellHook = ''
    export PGDATA="$PWD/.nix-shell/var/lib/postgres/data"

    if [ ! -d $PGDATA ]; then
      ${pkgs.postgresql_11}/bin/pg_ctl init
    fi

    ${pkgs.postgresql_11}/bin/pg_ctl start -o "-c listen_addresses="
  '';
}
