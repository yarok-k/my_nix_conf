{ lib, ... }:

{
  imports = lib.filter
    (path:
      # Исключаем сам default.nix, чтобы не уйти в бесконечную рекурсию
      baseNameOf path != "default.nix" &&
      # Берем только файлы с расширением .nix
      lib.hasSuffix ".nix" (toString path)
    )
    (lib.filesystem.listFilesRecursive ./.);
}
