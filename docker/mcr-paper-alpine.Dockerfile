FROM jcxldn/minecraft-runner:paper-alpine

COPY ./entrypoint.sh /runner/ptero.entrypoint.sh

MAINTAINER JCX <docker@jcx.ovh>

RUN apk add --no-cache --update curl ca-certificates openssl git tar sqlite fontconfig \
    && adduser -D -h /home/container container \
    && chmod +x /runner/ptero.entrypoint.sh \
    # Paper-exclusive entry: Make /data/cache writeable for all users to prevent crashes when patching a jar.
    && mkdir -p /data \
    && chmod -R 777 /data

USER container
ENV  USER=container HOME=/home/container OVERRIDE_JAR_DL_PATH=/home/container/server.jar

WORKDIR /home/container

ENTRYPOINT ["/runner/ptero.entrypoint.sh"]
