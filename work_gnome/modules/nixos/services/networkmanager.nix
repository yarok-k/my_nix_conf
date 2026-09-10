{ config, lib, pkgs, hostname, ... }:
{
  networking.networkmanager.enable = true;
  networking.hostName = hostname;
}
