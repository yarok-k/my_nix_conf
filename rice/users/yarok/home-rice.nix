{ pkgs, pkgs-unstable, ... }:

{
  home.stateVersion = "26.05"; # Ваша версия состояния Home Manager
  imports = [
    ../../common/users/home.nix
  ];
  home.packages = with pkgs; [
    pkgs.nemo
    pkgs.kitty
    pkgs.nwg-drawer
  ];
}
