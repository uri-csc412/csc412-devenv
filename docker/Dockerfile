FROM ubuntu:jammy

LABEL org.opencontainers.image.source=https://github.com/csc412/csc412-devenv

COPY container-setup-amd64.sh /usr/local/bin/container-setup-amd64
COPY container-setup-common.sh /usr/local/bin/container-setup-common

# set default locale
ENV LANG en_US.UTF-8

RUN /usr/local/bin/container-setup-amd64

# git build arguments
ARG USER=csc412\ User
ARG EMAIL=nobody@example.com

# configure your environment
USER csc412-user

WORKDIR /home/csc412-user
CMD ["/bin/bash", "-l"]
