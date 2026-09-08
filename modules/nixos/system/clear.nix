{ config, pkgs, ... }:

{
  nix.settings.auto-optimise-store = true; # Авто-оптимизация при каждой сборке

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d"; # Удалять поколения старше 7 дней
  };
}
