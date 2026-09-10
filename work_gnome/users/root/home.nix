{ pkgs, pkgs-unstable, ... }:

{
  home.stateVersion = "26.05";

  # Базовые админские утилиты только для root
  home.packages = with pkgs; [
    vim
    nano
    wget
    curl
  ];

  # Удобные алиасы для root
  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "nixos-rebuild switch --flake .";
    };
  };
}
