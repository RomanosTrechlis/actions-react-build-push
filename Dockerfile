FROM node:17-alpine

MAINTAINER Romanos Trechlis <r.trechlis@gmail.com>

RUN apk add --no-cache git; \
    apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing hub; \
    rm -rf /var/cache/* ;\
    rm -rf /root/.cache/*

ADD entrypoint.sh /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["sh", "/entrypoint.sh"]