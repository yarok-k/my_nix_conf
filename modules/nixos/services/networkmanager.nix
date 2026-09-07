{ config, lib, pkgs, ... }:
{
  networking.networkmanager.enable = true;
  networking.hostName = "yarok-pc";
}
