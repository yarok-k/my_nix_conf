{ pkgs, ... }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    clang
    gcc
    gdb
    cmake
  ];

  buildInputs = with pkgs; [
    # Сюда же можно прокинуть Python с пакетами, если нужно
    # (python3.withPackages (ps: with ps; [
    # ]))
  ];
  LIBCLANG_PATH = "${pkgs.llvmPackages.libclang.lib}/lib";
}
