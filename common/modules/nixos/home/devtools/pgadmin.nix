{ pkgs, pkgs-unstable, inputs, ... }:
{
  home.stateVersion = "26.05"; # Ваша версия состояния Home Manager
  services.flatpak = {
    packages = [
      "org.pgadmin.pgadmin4"
    ];
  };
}
