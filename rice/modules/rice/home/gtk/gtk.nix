{ config, ... }:
{
  xdg.configFile."gtk-3.0/gtk.css".source =
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/Dotfiles/nixos/rice/modules/rice/home/gtk/gtk.css";
  xdg.configFile."gtk-4.0/gtk.css".source =
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/Dotfiles/nixos/rice/modules/rice/home/gtk/gtk.css";
}
