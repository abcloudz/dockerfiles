FROM runmymind/docker-android-sdk:latest
LABEL maintainer "DBBEST Android"

RUN dpkg --add-architecture i386 && apt-get update -yqq && apt-get install -y \
    jq