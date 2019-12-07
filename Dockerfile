FROM node:10-alpine

MAINTAINER Arnaud LIER, <zeprofdecoding@gmail.com>

RUN apk add --no-cache --update libc6-compat ffmpeg \
    && adduser -D -h /home/container container

    # Ensure UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
