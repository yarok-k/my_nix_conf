{ config, lib, pkgs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Опционально
    dedicatedServer.openFirewall = true; # Опционально
  };
}
