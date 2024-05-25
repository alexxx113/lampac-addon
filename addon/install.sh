#!/bin/bash

# Проверка корневого доступа
if [ "$(id -u)" != "0" ]; then
    echo "Please run this script as root."
    exit 1
fi

# Установка зависимостей
apt-get update && apt-get install -y nginx php-fpm php-mysql php-mbstring php-gd php-curl

# Установка LAMPAC
# (ваш код для установки LAMPAC)

# Запуск LAMPAC
# (ваш код для запуска LAMPAC)
