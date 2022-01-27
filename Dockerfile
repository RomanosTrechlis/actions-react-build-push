FROM node:17-alpine

MAINTAINER Romanos Trechlis <r.trechlis@gmail.com>

ADD entrypoint.sh /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["sh", "/entrypoint.sh"]