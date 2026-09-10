{ config, lib, pkgs, ... }:

{
  programs.hyprland = {
      enable = true;
      xwayland.enable = true; # Поддержка приложений на X11
    };
  hardware.graphics.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
}
