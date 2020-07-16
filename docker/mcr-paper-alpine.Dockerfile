FROM jcxldn/minecraft-runners:paper-alpine

MAINTAINER JCX <docker@jcx.ovh>

RUN apk add --no-cache --update curl ca-certificates openssl git tar sqlite fontconfig \
    && adduser -D -h /home/container container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /runner/ptero.entrypoint.sh

CMD ["/bin/sh", "/runner/ptero.entrypoint.sh"]
