FROM        node:10-alpine

LABEL       author="Arnaud LIER" maintainer="zeprofdecoding@gmail.com"

RUN         apk add --no-cache --update libc6-compat ffmpeg \
            && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/ash", "/entrypoint.sh"]
