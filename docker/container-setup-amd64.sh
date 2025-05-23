#!/bin/bash

set -eu

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)
target_user="${1:-csc412-user}"

export DEBIAN_FRONTEND=noninteractive

apt-get update &&\
    yes | unminimize

apt-get -y install passwd sudo
which useradd

# install GCC-related packages
apt-get update && apt-get -y install\
			  binutils-doc\
			  cpp-doc\
			  gcc-doc\
			  g++\
			  g++-multilib\
			  gdb\
			  gdb-doc\
			  gdbserver\
			  glibc-doc\
			  libblas-dev\
			  liblapack-dev\
			  liblapack-doc\
			  libstdc++-11-doc\
			  make\
			  make-doc

# Do main setup
$SCRIPT_DIR/container-setup-common $target_user

# create binary reporting version of dockerfile
(echo '#\!/bin/sh'; echo 'echo 1') > /usr/bin/csc412-docker-version && chmod ugo+rx,u+w,go-w /usr/bin/csc412-docker-version

rm -f /root/.bash_logout
