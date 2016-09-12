FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y libxml2-utils
RUN apt-get install -y default-jdk
RUN apt-get install -y maven
RUN apt-get install -y firefox=45.0.2+build1-0ubuntu1
RUN apt-get install -y xvfb
RUN apt-get install -y curl wget
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -
RUN apt-get install -y nodejs
RUN apt-get install -y build-essential
RUN apt-get install -y libssl-dev

#========================================
# Add normal user with passwordless sudo
#========================================
RUN useradd jenkins --shell /bin/bash --create-home \
  && usermod -a -G sudo jenkins \
  && echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers \
  && echo 'jenkins:secret' | chpasswd


ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

ENV GIT_COMMITTER_EMAIL=me@hatescake.com
ENV GIT_COMMITTER_NAME=Hates
ENV GIT_AUTHOR_NAME=Cake
ENV GIT_AUTHOR_EMAIL=hates@cake.com

RUN git config --global user.signingkey F2C7AB29


