{ pkgs, pkgs-unstable, inputs, ... }:
{
  home.stateVersion = "26.05"; # Ваша версия состояния Home Manager
  services.flatpak = {
    enable = true;
    # Автоматически добавляем репозиторий Flathub
    remotes = [{
      name = "flathub";
      location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    }];
    # Обновлять Flatpak-приложения при сборке системы
    update.auto.enable = true;
  };
}
