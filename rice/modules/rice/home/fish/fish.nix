{ pkgs, ... }:
{
  programs.fish = {
    enable = true;

    shellAliases = {
      dev = "nix develop ~/Dotfiles/nixos";
      dev_py = "nix develop ~/Dotfiles/nixos#dev_py";
      dev_c = "nix develop ~/Dotfiles/nixos#dev_c";
      hshell = "nix develop ~/Dotfiles/nixos#h_dev";
      devops = "nix develop ~/Dotfiles/nixos#devops";
    };

    # Убирает приветствие fish
    interactiveShellInit = ''
      set fish_greeting
    '';

    # Двухстрочный промпт со скриншота:
    #   <arch-иконка> : ~
    #   ╰─{user}❱❱❱
    functions = {
      fish_prompt = ''
        set -l c_icon 00ffe0
        set -l c_path AB0973
        set -l c_line 00ffe0
        set -l c_user 00ffe0

        # Первая строка: иконка, двоеточие, путь
        set_color $c_icon
        echo -ne '󱄅'
        set_color normal
        echo -n ' : '
        set_color $c_path
        echo (prompt_pwd)

        # Вторая строка: ╰─{user}❱❱❱
        set_color $c_line
        echo -n '╰─'
        set_color $c_user
        echo -n "{$USER}"
        set_color AB0973
        echo -n '❱'
        set_color 00ffe0
        echo -n '❱'
        set_color AB0973
        echo -n '❱'
        set_color normal
        echo -n ' '
      '';
    };
  };
}
