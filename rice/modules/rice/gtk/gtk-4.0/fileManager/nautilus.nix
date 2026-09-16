{ config, ... }:
{
  xdg.configFile."gtk-4.0/nautilus.css".source =
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/Dotfiles/nixos/rice/modules/rice/gtk/gtk-4.0/fileManager/nautilus.css";
  dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
      "org/gnome/nautilus/preferences" = {
        default-folder-viewer = "icon-view";
        show-hidden-files = true;
      };
    };
}
