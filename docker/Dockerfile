FROM ubuntu:22.04

# set environment variables for tzdata
ARG TZ=America/New_York
ENV TZ=${TZ}

# include manual pages and documentation
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update &&\
  yes | unminimize

# install GCC-related packages
RUN apt-get -y install\
 binutils-doc\
 cpp-doc\
 gcc-doc\
 g++\
 g++-multilib\
 gdb\
 gdb-doc\
 glibc-doc\
 libblas-dev\
 liblapack-dev\
 liblapack-doc\
 libstdc++-10-doc\
 make\
 make-doc

# install clang-related packages
RUN apt-get -y install\
 clang\
 clang-format

# install programs used for system exploration
RUN apt-get -y install\
 blktrace\
 linux-tools-generic\
 strace\
 tcpdump

# install interactive programs (emacs, vim, nano, man, sudo, etc.)
RUN apt-get -y install\
 bc\
 curl\
 dc\
 git\
 git-doc\
 man\
 micro\
 nano\
 psmisc\
 sudo\
 wget

# set up libraries
RUN apt-get -y install\
 libreadline-dev\
 locales\
 wamerican\
 libssl-dev

# install programs used for networking
RUN apt-get -y install\
 dnsutils\
 inetutils-ping\
 iproute2\
 net-tools\
 netcat\
 telnet\
 time\
 traceroute

# set up default locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

# remove unneeded .deb files
RUN rm -r /var/lib/apt/lists/*

# set up passwordless sudo for user csc412-user
RUN useradd -m -s /bin/bash csc412-user && \
  echo "csc412-user ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/csc412-init

# create binary reporting version of dockerfile
RUN (echo '#\!/bin/sh'; echo 'echo 1') > /usr/bin/csc412-docker-version; chmod ugo+rx,u+w,go-w /usr/bin/csc412-docker-version

# git build arguments
ARG USER=csc412\ User
ARG EMAIL=nobody@example.com

# configure your environment
USER csc412-user
RUN rm -f ~/.bash_logout

WORKDIR /home/csc412-user
CMD ["/bin/bash", "-l"]
