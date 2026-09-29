{ pkgs, pkgs-unstable, inputs, ... }:
{
  home.stateVersion = "26.05"; # Ваша версия состояния Home Manager
  programs.fish = {
    enable = true;
    shellAliases = {
      dev = "nix develop ~/Dotfiles/nixos";
      dev_py = "nix develop ~/Dotfiles/nixos#dev_py";
      dev_c = "nix develop ~/Dotfiles/nixos#dev_c";
      hshell = "nix develop ~/Dotfiles/nixos#h_dev";
      devops = "nix develop ~/Dotfiles/nixos#devops";
    };
  };
}
