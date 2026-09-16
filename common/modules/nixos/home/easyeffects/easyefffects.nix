{ pkgs, pkgs-unstable, inputs, ... }:
{
  home.stateVersion = "26.05"; # Ваша версия состояния Home Manager
  home.packages = [
    pkgs.easyeffects
  ];
}
