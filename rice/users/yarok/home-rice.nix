{ pkgs, pkgs-unstable, ... }:

{
  # imports = [
  #     ../../modules/rice/hyprland
  #   ];
  home.stateVersion = "26.05"; # Ваша версия состояния Home Manager
  home.packages = with pkgs; [
    pkgs.nemo
    pkgs.alacritty
    pkgs.nwg-drawer
    pkgs.fuzzel
    pkgs.adwaita-icon-theme
  ];
}
