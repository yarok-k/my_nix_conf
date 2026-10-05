{ config, lib, pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.rust-analyzer
    pkgs.rustc
    pkgs.cargo
    pkgs.nil
  ];
}
