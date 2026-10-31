{ pkgs, ...}:
{
  home.packages = [pkgs.adwaita-icon-theme];

  gtk = {
    enable = true;
    iconTheme = {
      name = "Adwatia";
      package = pkgs.adwaita-icon-theme;
    };
  };
}
