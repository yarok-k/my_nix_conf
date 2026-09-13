{ pkgs, ... }:
{
  home.stateVersion = "26.05";
  home.packages = with pkgs; [
    git
    rustc
    cargo
    rust-analyzer
    python3
    gcc
  ];
}
