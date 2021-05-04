FROM cirrusci/flutter:latest
LABEL maintainer "3rd party developers"

RUN set -o xtrace \
    && apt update \
    && apt install -y cl-base64 \
    && apt install -y coreutils 
