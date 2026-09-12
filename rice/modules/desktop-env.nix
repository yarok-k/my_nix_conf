{ config, lib, pkgs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  hardware.graphics.enable = true;
  programs.dconf.enable = true;
  programs.hyprland = {
      enable = true;
      xwayland.enable = true; # Поддержка приложений на X11
    };
}
