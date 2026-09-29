{ pkgs, ... }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    python3
    ansible
    kubectl
    docker-compose
    kubernetes-helm
    docker
  ];
  LIBCLANG_PATH = "${pkgs.llvmPackages.libclang.lib}/lib";
}
