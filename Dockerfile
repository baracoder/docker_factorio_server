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

RUN apk --update --no-cache add bash curl

EXPOSE 34197/udp 27015/tcp

ENV SERVER_NAME="factorio server" \
    SERVER_DESCRIPTION="" \
    SERVER_VISIBILITY="hidden" \
    SERVER_GAME_PASSWORD="" \
    SERVER_VERIFY_IDENTITY="true"

CMD ["./new_smart_launch.sh"]

ARG VERSION=0.13.5
ARG FACTORIO_SHA1=34d2601e463995a035ebb882ef0e304c11d50249

RUN curl -sSL --cacert /opt/factorio.crt https://www.factorio.com/get-download/$VERSION/headless/linux64 -o /tmp/factorio_headless_x64_$VERSION.tar.gz && \
    sha1sum /tmp/factorio_headless_x64_$VERSION.tar.gz && \
    echo "$FACTORIO_SHA1  /tmp/factorio_headless_x64_$VERSION.tar.gz" | sha1sum -c && \
    tar xzf /tmp/factorio_headless_x64_$VERSION.tar.gz && \
    rm /tmp/factorio_headless_x64_$VERSION.tar.gz


