{ ... }:

{
  services.postgresql = {
    enable = true;
    ensureDatabase = [
      "backend"
    ];
  };
}
