{ pkgs-unstable, ... }:
{
  home.stateVersion = "26.05"; # Ваша версия состояния Home Manager
  services.flatpak = {
    packages = [
      "io.dbeaver.DBeaverCommunity"
      "org.pgadmin.pgadmin4"
    ];
  };
  home.packages = [
    pkgs-unstable.mysql-workbench
  ];
}
