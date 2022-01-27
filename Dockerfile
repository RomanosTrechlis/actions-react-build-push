FROM node:17-alpine

MAINTAINER Romanos Trechlis <r.trechlis@gmail.com>

RUN apk add --no-cache git

ADD entrypoint.sh /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["sh", "/entrypoint.sh"]