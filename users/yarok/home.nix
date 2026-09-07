{ pkgs, pkgs-unstable, ... }:

{
  home.stateVersion = "26.05"; # Ваша версия состояния Home Manager
  home.packages = with pkgs; [
    #stable pakages
    pkgs.git
    pkgs.zed-editor
    pkgs.fastfetch
    pkgs.discord
    #unstable pakages
    pkgs-unstable.telegram-desktop
    pkgs-unstable.yandex-music
    pkgs-unstable.spotify
  ];

  # Персональная настройка fish
  programs.fish = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake .";
    };
  };
}
