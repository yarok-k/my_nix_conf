{ pkgs, ... }:

{
  services.postgresql = {
    enable = true;

    # Скрипт, который выполнится один раз при первой инициализации БД
    initialScript = pkgs.writeText "init-pg-script.sql" ''
      ALTER USER postgres WITH PASSWORD '1234';
    '';

    # Разрешаем подключение по паролю для локальной сети/127.0.0.1
    authentication = pkgs.lib.mkOverride 10 ''
      # type  database        user            address                 auth-method
      local   all             all                                     trust
      host    all             all             127.0.0.1/32            md5
      host    all             all             ::1/128                 md5
    '';
  };
}
