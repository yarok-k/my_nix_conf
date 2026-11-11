{ lib, ... }:

let
  inherit (lib.hm.gvariant) mkTuple;
in
{
  dconf.settings."org/gnome/desktop/input-sources" = {
    sources = [
      (mkTuple [ "xkb" "us" ])
      (mkTuple [ "xkb" "ru" ])
    ];
    # Super+Space переключает раскладку в GNOME по умолчанию,
    # xkb-options с grp:win_space_toggle не нужен
  };
}
