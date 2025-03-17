FROM alpine:3.21

LABEL maintainer="S Saha"
LABEL org.opencontainers.image.source="https://github.com/atssj/gh-actions"
LABEL org.opencontainers.image.description="FTP Deploy Action Container"

RUN apk add --no-cache \
    lftp \
    ca-certificates \
    bash

COPY src/main.sh /usr/local/bin/ftp-deploy
RUN chmod +x /usr/local/bin/ftp-deploy

ENTRYPOINT ["ftp-deploy"]
