{ config, lib, pkgs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  hardware.graphics.enable = true;
  programs.dconf.enable = true;
  programs.niri.enable = true;
  services.displayManager.sessionPackages = [pkgs.niri];
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      niri = {
        default = [ "gnome" "gtk" ];
      };
    };
  };

  environment.systemPackages = [
    pkgs.xwayland-satellite
  ];
}
