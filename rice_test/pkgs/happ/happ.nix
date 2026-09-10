{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    "${inputs.happ-proxy}/happ-module.nix"
  ];

  services.happ.enable = true;
}
