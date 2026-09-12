{ config, lib, pkgs, inputs, hostname, ... }:

{
  # Imports ВСЕГДА должны быть на самом верхнем уровне модуля
  imports = [
    inputs.opendeck-nix.nixosModules.default
  ];

  # Все условные конфигурации помещаем строго в секцию config
  config = lib.mkIf (hostname == "yarok-pc") {
    programs.opendeck.enable = true;

    users.groups.plugdev = { };
    users.users.yarok.extraGroups = [ "plugdev" ];

    services.udev.extraRules = ''
      KERNEL=="hidraw*", ATTRS{idVendor}=="3142", ATTRS{idProduct}=="0007", MODE="0660", GROUP="plugdev"
      SUBSYSTEM=="usb", ATTRS{idVendor}=="3142", ATTRS{idProduct}=="0007", MODE="0660", GROUP="plugdev"
    '';
  };
}
