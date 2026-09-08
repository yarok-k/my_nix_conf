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
            ./hosts/desktop
            ./modules
            ./users
            ./pkgs
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
            ./hosts/laptop
            ./modules
            ./users
            ./pkgs
          ];
        };
      };
    };
}
