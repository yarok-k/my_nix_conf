{ pkgs, ... }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    wifite2
  ];

  buildInputs = with pkgs; [
    # (python3.withPackages (ps: with ps; [
    # ]))
  ];
  LIBCLANG_PATH = "${pkgs.llvmPackages.libclang.lib}/lib";
}
