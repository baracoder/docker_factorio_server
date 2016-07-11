FROM frolvlad/alpine-glibc:alpine-3.3_glibc-2.23

MAINTAINER <baracoder@googlemail.com>

WORKDIR /opt

COPY ./new_smart_launch.sh /opt
COPY ./factorio.crt /opt

VOLUME /opt/factorio/saves /opt/factorio/mods

ENV FACTORIO_AUTOSAVE_INTERVAL=2 \
    FACTORIO_AUTOSAVE_SLOTS=3 \
    FACTORIO_ALLOW_COMMANDS=false \
    FACTORIO_NO_AUTO_PAUSE=false \
    FACTORIO_LATENCY_MS=100 \
    FACTORIO_WAITING=false \
    FACTORIO_MODE=normal

EXPOSE 34197/udp 27015/tcp

ENV SERVER_NAME="factorio server" \
    SERVER_DESCRIPTION="" \
    SERVER_VISIBILITY="hidden" \
    SERVER_GAME_PASSWORD="" \
    SERVER_VERIFY_IDENTITY="true"

CMD ["./new_smart_launch.sh"]

ARG VERSION=0.13.7
ARG FACTORIO_SHA1=2e956210fba6f39229b13697725a7b0142491596

ADD https://www.factorio.com/get-download/$VERSION/headless/linux64 /tmp/factorio_headless_x64_$VERSION.tar.gz
RUN sha1sum /tmp/factorio_headless_x64_$VERSION.tar.gz && \
    echo "$FACTORIO_SHA1  /tmp/factorio_headless_x64_$VERSION.tar.gz" | sha1sum -c && \
    tar xzf /tmp/factorio_headless_x64_$VERSION.tar.gz && \
    rm /tmp/factorio_headless_x64_$VERSION.tar.gz


