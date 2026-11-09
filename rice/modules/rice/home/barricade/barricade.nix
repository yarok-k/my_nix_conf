{ config, ... }:
{
  xdg.configFile."barricade/bar.bst".source =
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/Dotfiles/nixos/rice/modules/rice/home/barricade/bar.bst";
  xdg.configFile."barricade/style.css".source =
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/Dotfiles/nixos/rice/modules/rice/home/barricade/style.css";
}
