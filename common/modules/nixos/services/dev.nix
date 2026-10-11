{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.rust-analyzer
    pkgs.rustc
    pkgs.cargo
    pkgs.nil
    pkgs.nixd
    pkgs.python3
    pkgs.clang
  ];
}
