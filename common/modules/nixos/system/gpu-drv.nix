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

    # AMD DRV
    (lib.mkIf (gpuvendor == "amd") {
      services.xserver.videoDrivers = [ "amdgpu" ];
      hardware.amdgpu.initrd.enable = true;
      hardware.graphics.extraPackages = with pkgs; [
        rocmPackages.clr.icd
      ];
    })

  ];
}
