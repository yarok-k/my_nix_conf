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
      };

      nixosConfigurations = {
        yarok-pc = nixpkgs.lib.nixosSystem {
          inherit system pkgs;
          specialArgs = {
            inherit inputs pkgs-unstable;
            hostname = "yarok-pc";
          };
          modules = [
            inputs.home-manager.nixosModules.home-manager # Обязательно подключаем сам HM модуль
            ./common/hosts/desktop
            ./common/modules/nixos
            ./common/users
            ./common/pkgs
            ./work/modules/desktop-env.nix
          ];
        };

        yarok-laptop = nixpkgs.lib.nixosSystem {
          inherit system pkgs;
          specialArgs = {
            inherit inputs pkgs-unstable;
            hostname = "yarok-laptop";
          };
          modules = [
            inputs.home-manager.nixosModules.home-manager
            ./common/hosts/laptop
            ./common/modules/nixos
            ./common/users
            ./common/pkgs
            ./work/modules/desktop-env.nix
          ];
        };

        yarok-pc-rice = nixpkgs.lib.nixosSystem {
          inherit system pkgs;
          specialArgs = {
            inherit inputs pkgs-unstable;
            hostname = "yarok-pc";
          };
          modules = [
            inputs.home-manager.nixosModules.home-manager
            ./common/hosts/desktop
            ./common/modules/nixos
            ./common/users
            ./common/pkgs
            ./rice/modules/desktop-env.nix
          ];
        };

        yarok-laptop-rice = nixpkgs.lib.nixosSystem {
          inherit system pkgs;
          specialArgs = {
            inherit inputs pkgs-unstable;
            hostname = "yarok-laptop";
          };
          modules = [
            inputs.home-manager.nixosModules.home-manager
            ./common/hosts/laptop
            ./common/modules/nixos
            ./common/users
            ./common/pkgs
            ./rice/modules/desktop-env.nix
          ];
        };
      };
    };
}
