FROM cirrusci/flutter:1.22.6
LABEL maintainer "0"

RUN set -o xtrace \
    && apt-get update \
    && apt-get install -y coreutils \
    && base64 -d test
