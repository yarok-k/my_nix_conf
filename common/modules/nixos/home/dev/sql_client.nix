{ pkgs-unstable, pkgs, ... }:
{
  home.stateVersion = "26.05"; # Ваша версия состояния Home Manager
  services.flatpak = {
    packages = [
      "io.dbeaver.DBeaverCommunity"
      "org.pgadmin.pgadmin4"
    ];
  };
  home.packages = [
    (pkgs.symlinkJoin {
      name = "mysql-workbench";
      paths = [ pkgs.mysql-workbench ];
      nativeBuildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/mysql-workbench \
          --set GDK_BACKEND x11 \
          --set GDK_SCALE 1 \
          --set GDK_DPI_SCALE 1
      '';
    })
  ];
}
