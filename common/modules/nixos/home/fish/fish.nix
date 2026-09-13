{ pkgs, pkgs-unstable, inputs, ... }:
{
  home.stateVersion = "26.05"; # Ваша версия состояния Home Manager
  programs.fish = {
    enable = true;
    shellAliases = {
      dev = "nix develop ~/Dotfiles/nixos";
      dev_py = "nix develop ~/Dotfiles/nixos#dev_py";
    };
  };
}
