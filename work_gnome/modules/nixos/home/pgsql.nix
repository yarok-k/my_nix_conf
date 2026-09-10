{ pkgs, ... }:

{
  services.postgresql = {
    enable = true;

    # ensureUsers создает пользователя или обновляет его параметры при каждом запуске службы
    ensureUsers = [
      {
        name = "postgres";
        ensureClauses = {
          superuser = true;
          login = true;
        };
      }
    ];

    # Скрипт для принудительного обновления пароля при каждом старте службы
    postStart = ''
      $PSQL -tA -c "ALTER USER postgres WITH PASSWORD '1234';"
    '';

    # Разрешаем подключение по паролю
    authentication = pkgs.lib.mkOverride 10 ''
      # type  database        user            address                 auth-method
      local   all             all                                     trust
      host    all             all             127.0.0.1/32            md5
      host    all             all             ::1/128                 md5
    '';
  };
}
