{ config, lib, pkgs, inputs, hostname, ... }:

{
  imports = [
    inputs.opendeck-nix.nixosModules.default
  ];

  config = lib.mkIf (hostname == "yarok-pc") {
    programs.opendeck.enable = true;

    # Создаем группу plugdev (если она еще не существует глобально)
    users.groups.plugdev = { };

    # Добавляем пользователя yarok в plugdev, а также в стандартную группу input
    users.users.yarok.extraGroups = [ "plugdev" "input" ];

    # Расширенные правила udev
    services.udev.extraRules = ''
      # 1. Права на саму панель OpenDeck (для получения сигналов)
      KERNEL=="hidraw*", ATTRS{idVendor}=="3142", ATTRS{idProduct}=="0007", MODE="0660", GROUP="plugdev"
      SUBSYSTEM=="usb", ATTRS{idVendor}=="3142", ATTRS{idProduct}=="0007", MODE="0660", GROUP="plugdev"

      # 2. Права на uinput (для эмуляции нажатий клавиатуры, мыши и шорткатов)
      KERNEL=="uinput", SUBSYSTEM=="misc", MODE="0660", GROUP="plugdev", OPTIONS+="static_node=uinput"
    '';
    environment.systemPackages = with pkgs; [
      playerctl
    ];
  };
}
