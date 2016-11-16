FROM ubuntu:16.04
MAINTAINER Daniel Ng See Cheong <danielpnsc@gmail.com>
ENV DEBIAN_FRONTEND noninteractive
ENV ANDROID_HOME=$PWD/android-sdk-linux
RUN apt-get update && apt-get upgrade -y && apt-get install openjdk-8-jdk-headless wget -y
RUN wget --quiet --output-document=android-sdk.tgz https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz && tar --extract --gzip --file=android-sdk.tgz
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter android-25
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter platform-tools
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter build-tools-25.0.0
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-android-m2repository
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-google-google_play_services
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-google-m2repository
