FROM alpine:latest

WORKDIR /server
COPY . .
RUN apk update \
  && apk add --no-cache \
    bind-tools \
    g++ \
    gcc \
    libressl-dev \
    libstdc++ \
    linux-headers \
    make \
    mariadb-connector-c \
    mariadb-dev \
    mysql-client \
    netcat-openbsd \
    pcre \
    pcre-dev \
    zlib-dev \
  && ./configure --enable-packetver=20200401 --enable-vip=yes \
  && make clean \
  && make server \
  && chmod a+x login-server && chmod a+x char-server && chmod a+x map-server \
  && apk del git make linux-headers gcc g++ mariadb-dev zlib-dev pcre-dev libressl-dev
