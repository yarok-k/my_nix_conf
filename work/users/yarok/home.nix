{ pkgs, pkgs-unstable, ... }:

{
  home.stateVersion = "26.05"; # Ваша версия состояния Home Manager

  imports = [
    ../../modules/dots/home
  ];

  home.packages = with pkgs; [
    pkgs.vim
  ];

  xdg.portal.config = {
    org.freedesktop.impl.portal.FileChooser = {
      backend = "gtk";
      options = {
        layout = "us,ru";
        options = "grp:win_space_toggle";
      };
    };
  };
}
