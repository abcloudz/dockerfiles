FROM abcloudz/android-runner:basic

LABEL maintainer "ABCloudz"

RUN dpkg --add-architecture i386 && apt-get update -yqq && apt-get install -y \
  openjdk-8-jdk \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*