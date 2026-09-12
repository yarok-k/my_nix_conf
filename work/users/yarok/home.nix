{ pkgs, pkgs-unstable, inputs, ... }:

{
  home.stateVersion = "26.05"; # Ваша версия состояния Home Manager
  home.packages = with pkgs; [
    #stable pakages
    pkgs.git
    pkgs.fastfetch
    pkgs.discord
    pkgs.obsidian
    pkgs.nextcloud-client
    pkgs.onlyoffice-desktopeditors
    #unstable pakages
    pkgs-unstable.zed-editor
    pkgs-unstable.telegram-desktop
    pkgs-unstable.yandex-music
    pkgs-unstable.spotify
    pkgs-unstable.steam
  ];
  services.flatpak = {
    enable = true;

    # Автоматически добавляем репозиторий Flathub
    remotes = [{
      name = "flathub";
      location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    }];

    packages = [
      "org.pgadmin.pgadmin4"
    ];

    # Обновлять Flatpak-приложения при сборке системы
    update.auto.enable = true;
  };

  # Персональная настройка fish
  programs.fish = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake";
      dev = "nix develop ~/Dotfiles/work";
    };
  };
}
