{ pkgs, ...}:
{
  home.packages = [pkgs.material-icons];

  gtk = {
    enable = true;
    iconTheme = {
      name = "Material-Dark";
      package = pkgs.material-icons;
    };
  };
}
