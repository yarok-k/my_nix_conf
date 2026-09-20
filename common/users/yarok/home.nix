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
    #unstable pakages
    pkgs-unstable.zed-editor
    pkgs-unstable.telegram-desktop
    pkgs-unstable.spotify
  ];

}
