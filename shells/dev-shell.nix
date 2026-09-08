{ pkgs }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
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
  ];

  buildInputs = with pkgs; [
    # Сюда же можно прокинуть Python с пакетами, если нужно
    # (python3.withPackages (ps: with ps; [
    # ]))
  ];
}
