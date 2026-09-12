{ config, lib, pkgs, ... }:
{
  time.timeZone = "Europe/Moscow";
  time.hardwareClockInLocalTime = true;
}
