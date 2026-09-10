{ pkgs, pkgs-unstable, ... }:

{
  home.stateVersion = "26.05"; # Ваша версия состояния Home Manager
  home.packages = with pkgs; [
    #stable pakages
    pkgs.git
    pkgs.fastfetch
    pkgs.discord
    pkgs.obsidian
    pkgs.nextcloud-client
    pkgs.onlyoffice-desktopeditors
    pkgs.pgadmin4
    #unstable pakages
    pkgs-unstable.zed-editor
    pkgs-unstable.telegram-desktop
    pkgs-unstable.yandex-music
    pkgs-unstable.spotify
    pkgs-unstable.steam
  ];

  # Персональная настройка fish
  programs.fish = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake";
      dev = "nix develop ~/.config/nixos";
    };
  };
}
