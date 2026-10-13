{ inputs, pkgs-unstable, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    # Автоматически создавать бэкапы мешающих файлов (например, config.fish.backup)
    backupFileExtension = "backup";

    extraSpecialArgs = {
      inherit pkgs-unstable;
    };
  };
}
