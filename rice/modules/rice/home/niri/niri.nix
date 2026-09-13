{ config, ... }:
{
  xdg.configFile."niri/config.kdl".source =
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/Dotfiles/nixos/rice/modules/rice/home/niri/config.kdl";
}
