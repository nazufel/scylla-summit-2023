# dockerfile

# dockerfiles are used to build docker images - https://docs.docker.com/develop/develop-images/dockerfile_best-practices/

# start with the base image of Ubuntu 20.04 - https://hub.docker.com/_/ubuntu
FROM ubuntu:20.04

# install required packages to run demo
RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    openssh-server python3 python3-pip python3-apt \
    && rm -rf /var/lib/apt/lists/*

# install ansible
RUN pip3 install ansible