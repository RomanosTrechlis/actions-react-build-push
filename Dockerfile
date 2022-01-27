FROM node:17-alpine

MAINTAINER Romanos Trechlis <r.trechlis@gmail.com>

RUN npm install yarn -g

ADD entrypoint.sh /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]