FROM cirrusci/flutter:latest
LABEL maintainer "3rd party developers"

RUN set -o xtrace \
    && apt-get update \
    && apt-get install -y coreutils \
    && base64 -d test
