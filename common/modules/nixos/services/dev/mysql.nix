{ pkgs, ... }:
{
  services.mysql = {
    enable = true;
    package = pkgs.mysql84;
    ensureDatabases = [ "mydb" ];
    ensureUsers = [
      {
        name = "myuser";
        ensurePermissions = {
          "mydb.*" = "ALL PRIVILEGES";
        };
      }
    ];
  };
}
