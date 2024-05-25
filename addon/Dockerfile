FROM immisterio/lampac:latest

# Измените имя образа
LABEL name="alexxx113/lampac-addon"

# Установка Addon
RUN apt-get update && apt-get install -y python3-pip && pip3 install homeassistant-addon-installer
RUN homeassistant-addon-installer --installer-path /config/install.sh \
    --addon-name "LAMPAC" \
    --addon-description "LAMPAC Addon" \
    --addon-version "1.0.0" \
    --addon-author "alexxx113" \
    --addon-website "https://github.com/immisterio/Lampac" \
    --addon-icon "icon.png" \
    --addon-category "Server" \
    --addon-repo "alexxx11/lampac-addon" \
    --addon-image "alexxx11/lampac-addon:latest" \
    --addon-maintainer "alexxx11"

# Добавьте дополнительные команды для настройки LAMPAC
# ...

CMD ["/bin/bash"]
