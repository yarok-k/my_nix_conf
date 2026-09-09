{ pkgs, ... }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    gcc
    python3
  ];

  buildInputs = with pkgs; [
    # (python3.withPackages (ps: with ps; [
    # ]))
  ];
  LIBCLANG_PATH = "${pkgs.llvmPackages.libclang.lib}/lib";
}
