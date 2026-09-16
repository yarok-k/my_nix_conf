{pkgs, config, ...}:
{
  services.gvfs.enable = true;
  programs.dconf.enable = true;
  services.tumbler.enable = true;
  services.udisks2.enable = true;
  services.devmon.enable = true;
  boot.supportedFilesystems = [ "ntfs" "exfat" ];
}
