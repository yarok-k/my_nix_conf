{ config, lib, pkgs, ... }:
{
  programs.fish.enable = true;
  users.users.yarok = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
    shell = pkgs.fish;
  };
  home-manager.users.yarok = import ./home.nix;
}
