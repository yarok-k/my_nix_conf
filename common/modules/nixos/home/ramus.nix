{ pkgs, pkgs-unstable, ... }:
{
  home.packages = [
    (pkgs.symlinkJoin {
      name = "ramus-scaled";
      paths = [ pkgs-unstable.ramus ];
      nativeBuildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/ramus \
          --set GDK_SCALE 1 \
          --set JAVA_TOOL_OPTIONS "-Dsun.java2d.uiScale=1"
      '';
    })
  ];
}
