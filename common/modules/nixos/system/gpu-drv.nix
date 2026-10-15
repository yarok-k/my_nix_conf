{ config, lib, pkgs, inputs, gpuvendor, ... }:
{
  config = lib.mkMerge [
    (lib.mkIf (builtins.elem gpuvendor [ "nvidia" "amd" ]) {
      hardware.graphics = {
        enable = true;
        enable32Bit = true;
      };
    })

    # NVIDIA DRV
    (lib.mkIf (gpuvendor == "nvidia") {
      services.xserver.videoDrivers = [ "nvidia" ];
      hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = false;
        open = true;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.beta;
      };
    })
  ];
}
