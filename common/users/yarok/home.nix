{ pkgs, pkgs-unstable, inputs, ... }:
{
  home.stateVersion = "26.05"; # Ваша версия состояния Home Manager
  imports = [
    ../../modules/nixos/home
  ];
  home.packages = [
    #stable pakages
    pkgs.fastfetch
    pkgs.discord
    pkgs.obsidian
    pkgs.nextcloud-client
    pkgs.onlyoffice-desktopeditors
    pkgs.tree
    pkgs.zed-editor
    #unstable pakages
    pkgs-unstable.telegram-desktop
    pkgs-unstable.yandex-music
    pkgs-unstable.spotify
    pkgs-unstable.steam
  ];

}
