{ config, lib, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_zen;
  nixpkgs.config.allowUnfree = true;
}
