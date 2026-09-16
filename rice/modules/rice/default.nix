{ lib, ... }:

{
  imports = [
    ./system/login.nix
    ./system/gnome.nix
  ];
}
