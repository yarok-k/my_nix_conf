<<<<<<< HEAD
{ config, pkgs, inputs, ... }:
{
  home.packages = [
    inputs.barricade-bar.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.barricade-sound.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  xdg.configFile."barricade/bar.bst".source =
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/Dotfiles/nixos/rice/modules/rice/home/barricade/bar.bst";
  xdg.configFile."barricade/style.css".source =
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/Dotfiles/nixos/rice/modules/rice/home/barricade/style.css";
=======
{ config, lib, pkgs, inputs ? null, ... }:

let
  dotfiles = "${config.home.homeDirectory}/Dotfiles/nixos/rice/modules/rice/home/barricade";
in
{
  # Конфиг и стиль живут в репозитории дотфайлов и подхватываются на лету
  xdg.configFile."barricade/bar.bst".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/bar.bst";
  xdg.configFile."barricade/style.css".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/style.css";

>>>>>>> e1d1a4d (add: pc)
}
