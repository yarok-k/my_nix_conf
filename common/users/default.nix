{ lib, ... }:

{
  imports = lib.filter
    (path:
      baseNameOf path != "default.nix" &&
      baseNameOf path != "home.nix" && # Игнорируем home.nix!
      lib.hasSuffix ".nix" (toString path)
    )
    (lib.filesystem.listFilesRecursive ./.);
}
