FROM        openjdk:17-ea-jdk-alpine

RUN         adduser -D -h /home/container container \
            && ln -s /etc/localtime /etc/timezone

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

ENTRYPOINT  ["/entrypoint.sh"]
