{ pkgs, ... }:

{
  services.postgresql = {
    enable = true;

    # Автоматически создаёт или обновляет права и пароль пользователя при запуске
    ensureUsers = [
      {
        name = "postgres";
        ensureClauses = {
          superuser = true;
          login = true;
          password = "1234"; # Пароль задаётся напрямую здесь
        };
      }
    ];

    # Разрешаем подключение по паролю для 127.0.0.1
    authentication = pkgs.lib.mkOverride 10 ''
      # type  database        user            address                 auth-method
      local   all             all                                     trust
      host    all             all             127.0.0.1/32            md5
      host    all             all             ::1/128                 md5
    '';
  };
}
