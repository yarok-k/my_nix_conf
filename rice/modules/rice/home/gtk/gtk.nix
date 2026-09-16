{ config, pkgs, ... }:
{
  imports = [
    ../../gtk
  ];

  gtk = {
    enable = true;

    # Стили для GTK3
    gtk3.extraCss = ''
      @import url("shell.css");
    '';

    # Стили для GTK4 (включая Nautilus)
    gtk4.extraCss = ''
      @import url("nautilus.css");
      @import url("shell.css");
    '';
  };
}
