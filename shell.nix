{ pkgs ? import (fetchTarball {
  url = "https://github.com/NixOS/nixpkgs-channels/archive/06602f4bc76e46fe25e4c6e6e3db3f62714451d7.tar.gz";
  sha256 = "0a2pqnfk6m5ys2z47n463f86kqzk1g4527vib8fj9yagir4c1ph4";
}) {}
, nodejs ? pkgs.nodejs-10_x
}:

with pkgs; mkShell {
  buildInputs = [
    nixops
    nodePackages.node2nix
    nodejs
    postgresql
  ];
  shellHook = ''
    export PGDATA="$PWD/.postgres/data"

    if [ ! -d $PGDATA ]; then
      initdb --auth-local -D $PGDATA
    fi
  '';
}
