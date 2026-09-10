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
          inherit system;
          pkgs = pkgs;
          # Один общий specialArgs для всех системных модулей
          specialArgs = {
            inherit inputs pkgs-unstable;
            hostname = "yarok-pc";
          };
          modules = [
            ./work_gnome/hosts/desktop
            ./work_gnome/modules
            ./work_gnome/users
            ./work_gnome/pkgs
          ];
        };
        yarok-laptop = nixpkgs.lib.nixosSystem {
          inherit system;
          pkgs = pkgs;
          # Один общий specialArgs для всех системных модулей
          specialArgs = {
            inherit inputs pkgs-unstable;
            hostname = "yarok-laptop";
          };
          modules = [
            ./work_gnome/hosts/laptop
            ./work_gnome/modules
            ./work_gnome/users
            ./work_gnome/pkgs
          ];
        };
        yarok-pc-test = nixpkgs.lib.nixosSystem {
          inherit system;
          pkgs = pkgs;
          # Один общий specialArgs для всех системных модулей
          specialArgs = {
            inherit inputs pkgs-unstable;
            hostname = "yarok-pc";
          };
          modules = [
            ./rice_test/hosts/desktop
            ./rice_test/modules
            ./rice_test/users
            ./rice_test/pkgs
          ];
        };
        yarok-laptop-test = nixpkgs.lib.nixosSystem {
          inherit system;
          pkgs = pkgs;
          # Один общий specialArgs для всех системных модулей
          specialArgs = {
            inherit inputs pkgs-unstable;
            hostname = "yarok-laptop";
          };
          modules = [
            ./rice_test/hosts/laptop
            ./rice_test/modules
            ./rice_test/users
            ./rice_test/pkgs
          ];
        };
      };
    };
}
