# See https://github.com/omercnet/docker-httrack/blob/master/Dockerfile
FROM alpine:edge

RUN mkdir /websites && \
  echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
  apk add --no-cache --update httrack@testing && rm -rf /var/cache/apk/*

WORKDIR /websites

ENTRYPOINT [ "httrack" ]
