{ lib, ... }:

{
  imports = lib.filter
    (path:
      baseNameOf path != "default.nix" &&
      lib.hasSuffix ".nix" (toString path)
    )
    (lib.filesystem.listFilesRecursive ./.);
}
