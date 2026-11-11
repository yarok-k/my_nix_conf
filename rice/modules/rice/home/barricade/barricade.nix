{ config, pkgs, inputs, ... }:
{
  home.packages = [
    inputs.barricade-bar.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.barricade-sound.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.barricade-wallpaper.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  xdg.configFile."barricade/bar.bst".source =
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/Dotfiles/nixos/rice/modules/rice/home/barricade/bar.bst";
  xdg.configFile."barricade/style.css".source =
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/Dotfiles/nixos/rice/modules/rice/home/barricade/style.css";
}
