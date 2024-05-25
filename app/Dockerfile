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


RUN mkdir -p /config/lampac
#COPY --chown=hass:hass . /config/lampac
COPY . /config/lampac
#COPY /alarmserver/* /
#RUN chmod a+x /alarmserver-linux-raspberry


RUN curl -L -k -o publish.zip https://github.com/immisterio/Lampac/releases/latest/download/publish.zip \
    && unzip -o publish.zip && rm -f publish.zip && rm -rf merchant \
    && rm -rf runtimes/os* && rm -rf runtimes/win* && rm -rf runtimes/linux-arm runtimes/linux-arm64 runtimes/linux-musl-arm64 runtimes/linux-musl-x64 \
    && mv Lampac.runtimeconfig.json /config/lampac
RUN sed -i 's/\"System.GC.Server\"\: false/\"System.GC.Server\": true/g' /config/lampac/Lampac.runtimeconfig.json 



RUN curl -L -k -o minor.zip https://github.com/immisterio/Lampac/releases/latest/download/minor.zip && unzip -o minor.zip && rm -f minor.zip

RUN mkdir -p torrserver && curl -L -k -o torrserver/TorrServer-linux https://github.com/YouROK/TorrServer/releases/latest/download/TorrServer-linux-amd64 \
    && chmod +x torrserver/TorrServer-linux

RUN echo '{"puppeteer":{"executablePath":"/usr/bin/chromium"}}' > init.conf


ENTRYPOINT ["/usr/share/dotnet/dotnet", "Lampac.dll"]

#COPY --chown=hass:hass init.conf /config/lampac
COPY init.conf /config/lampac
VOLUME /config/lampac
