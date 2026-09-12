{ config, pkgs, ... }:
{
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
