FROM debian:12.5-slim

EXPOSE 9118
WORKDIR /home

RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates curl unzip sed chromium \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -L -k -o ffprobe.zip https://github.com/ffbinaries/ffbinaries-prebuilt/releases/download/v6.1/ffprobe-6.1-linux-64.zip \
    && unzip -o ffprobe.zip && rm -f ffprobe.zip \
    && mv ffprobe /usr/bin/ffprobe && chmod +x /usr/bin/ffprobe

RUN curl -fSL -k -o dotnet.tar.gz https://dotnetcli.azureedge.net/dotnet/aspnetcore/Runtime/6.0.28/aspnetcore-runtime-6.0.28-linux-x64.tar.gz \
    && mkdir -p /usr/share/dotnet \
    && tar -oxzf dotnet.tar.gz -C /usr/share/dotnet \
    && rm dotnet.tar.gz

# Изменения для Home Assistant addon:
RUN mkdir -p /config/lampac
COPY --chown=hass:hass . /config/lampac
