{ config, ... }:
{
  xdg.configFile."gtk-3.0/shell.css".source =
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/Dotfiles/nixos/rice/modules/rice/gtk/gtk-all/windows/shell.css";
  xdg.configFile."gtk-4.0/shell.css".source =
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/Dotfiles/nixos/rice/modules/rice/gtk/gtk-all/windows/shell.css";
}
