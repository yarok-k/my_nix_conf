{ config, lib, pkgs, inputs, pkgs-unstable, ... }:

{
  programs.fish.enable = true;

  users.users.yarok = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
    shell = pkgs.fish;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs pkgs-unstable; }; # Передаем аргументы в home.nix
    sharedModules = [
      inputs.nix-flatpak.homeManagerModules.nix-flatpak # Добавляем модуль nix-flatpak
    ];
    users.yarok = import ./home.nix;
  };
}
