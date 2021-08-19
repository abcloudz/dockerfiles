FROM ubuntu:20.04

LABEL maintainer "ABCloudz"

ENV DEBIAN_FRONTEND noninteractive

# share /opt/android-sdk-linux volume from host
ENV ANDROID_SDK_HOME /opt/android-sdk-linux
ENV ANDROID_SDK_ROOT /opt/android-sdk-linux
ENV ANDROID_HOME /opt/android-sdk-linux
ENV ANDROID_SDK /opt/android-sdk-linux


RUN dpkg --add-architecture i386 && apt-get update -yqq && apt-get install -y \
  curl \
  expect \
  git \
  make \
  libc6:i386 \
  libgcc1:i386 \
  libncurses5:i386 \
  libstdc++6:i386 \
  zlib1g:i386 \
  wget \
  unzip \
  vim \
  openssh-client \
  locales \
  tar \
  libio-socket-ssl-perl \
  libnet-ssleay-perl \
  sendemail \
  openjdk-11-jdk \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.UTF-8