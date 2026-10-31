{ pkgs, pkgs-unstable, ... }:

{
  home.stateVersion = "26.05"; # Ваша версия состояния Home Manager

  imports = [
    ../../modules/rice/home
  ];

  home.packages = with pkgs; [
    pkgs.vim
  ];
}
