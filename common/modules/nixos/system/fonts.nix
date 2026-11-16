{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;

    packages = with pkgs; [
      # Microsoft: Arial, Times New Roman, Courier New, Verdana и т.д.
      corefonts
      # Microsoft: Calibri, Cambria, Consolas, Segoe-подобные и т.д.
      vista-fonts

      # Open Sans
      open-sans

      # Nerd Fonts (с 25.05 каждый шрифт — отдельный пакет)
      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.symbols-only # только иконки, как запасной вариант
    ];

    fontconfig.defaultFonts = {
      sansSerif = [ "Open Sans" ];
      serif = [ "Times New Roman" ];
      monospace = [ "JetBrainsMono Nerd Font" ];
    };
  };
}
