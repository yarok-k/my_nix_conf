{ config, lib, pkgs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  hardware.graphics.enable = true;
  programs.dconf.enable = true;
  programs.niri.enable = true;
  services.displayManager.sessionPackages = [pkgs.niri];
  environment.systemPackages = [
    pkgs.xwayland-satellite
  ];
}
