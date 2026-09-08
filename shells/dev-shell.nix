{ pkgs, ... }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    pkg-config
    clang
    wrapGAppsHook3
    gcc
    gdb
    cmake
    rustc
    cargo
    rust-analyzer
    python3
    go
    ansible
    kubectl
    docker-compose
    usbutils
  ];

  buildInputs = with pkgs; [
    gtk3
    glib
    cairo
    pango
    gdk-pixbuf
    # Сюда же можно прокинуть Python с пакетами, если нужно
    # (python3.withPackages (ps: with ps; [
    # ]))
  ];
  LIBCLANG_PATH = "${pkgs.llvmPackages.libclang.lib}/lib";
}
