{ config, lib, pkgs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  hardware.graphics.enable = true;
  programs.dconf.enable = true;
  programs.niri.enable = true;
  services.displayManager.sessionPackages = [pkgs.niri];

  environment.etc."xdg/xdg-desktop-portal-wlr/config".text = ''
    [screencast]
    max_fps=30
    chooser_type=dmenu
    chooser_cmd=wmenu -p 'Поделиться:' -l 10
  '';

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      niri = {
        default = lib.mkForce [ "gtk" ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "wlr" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
      };
      common.default = lib.mkForce [ "gtk" ];
    };
  };

  environment.systemPackages = [
    pkgs.xwayland-satellite
  ];
}
