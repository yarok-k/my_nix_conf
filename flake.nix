{
  description = "yarok system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    happ-proxy = {
      url = "github:MrShitFox/happ-nixos";
      flake = false;
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    opendeck-nix.url = "github:Kitt3120/opendeck-nix";

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    nix-craftapps = {
      url = "github:olafkfreund/nix-craftapps";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... }@inputs:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      devShells.${system} = {
        default = import ./shells/dev-shell.nix { inherit pkgs; };
        dev_py = import ./shells/python-shell.nix { inherit pkgs; };
        dev_c = import ./shells/c-shell.nix { inherit pkgs; };
        h_dev = import ./shells/hack-shell.nix { inherit pkgs; };
        devops = import ./shells/devops-shell.nix { inherit pkgs; };
      };

      nixosConfigurations = {
        yarok-pc = nixpkgs.lib.nixosSystem {
          inherit system pkgs;
          specialArgs = {
            inherit inputs pkgs-unstable;
            gpuvendor = "nvidia"; # switch to amd for amd cards or intel for intel cards or nvidia for nvidia cards
            hostname = "yarok-pc";
            isrice = false;
          };
          modules = [
            inputs.home-manager.nixosModules.home-manager # Обязательно подключаем сам HM модуль
            inputs.nix-craftapps.nixosModules.default
            ./common/hosts/desktop
            ./common/modules/nixos
            ./common/users
            ./common/pkgs
            ./work/modules/desktop-env.nix
            #./work/modules/rice
          ];
        };

        yarok-laptop = nixpkgs.lib.nixosSystem {
          inherit system pkgs;
          specialArgs = {
            inherit inputs pkgs-unstable;
            gpuvendor = "amd"; # switch to amd for amd cards or intel for intel cards or nvidia for nvidia cards
            hostname = "yarok-laptop";
            isrice = false;
          };
          modules = [
            inputs.home-manager.nixosModules.home-manager
            inputs.nix-craftapps.nixosModules.default
            ./common/hosts/laptop
            ./common/modules/nixos
            ./common/users
            ./common/pkgs
            ./work/modules/desktop-env.nix
            #./work/modules/rice
          ];
        };

        yarok-pc-rice = nixpkgs.lib.nixosSystem {
          inherit system pkgs;
          specialArgs = {
            inherit inputs pkgs-unstable;
            gpuvendor = "nvidia"; # switch to amd for amd cards or intel for intel cards or nvidia for nvidia cards
            hostname = "yarok-pc";
            isrice = true;
          };
          modules = [
            inputs.home-manager.nixosModules.home-manager
            inputs.nix-craftapps.nixosModules.default
            ./common/hosts/desktop
            ./common/modules/nixos
            ./common/users
            ./common/pkgs
            ./rice/modules/desktop-env.nix
            ./rice/modules/rice
          ];
        };

        yarok-laptop-rice = nixpkgs.lib.nixosSystem {
          inherit system pkgs;
          specialArgs = {
            inherit inputs pkgs-unstable;
            gpuvendor = "amd"; # switch to amd for amd cards or intel for intel cards or nvidia for nvidia cards
            hostname = "yarok-laptop";
            isrice = true;
          };
          modules = [
            inputs.home-manager.nixosModules.home-manager
            inputs.nix-craftapps.nixosModules.default
            ./common/hosts/laptop
            ./common/modules/nixos
            ./common/users
            ./common/pkgs
            ./rice/modules/desktop-env.nix
            ./rice/modules/rice
          ];
        };
      };
    };
}
