# Build Stage
FROM --platform=linux/amd64 ubuntu:20.04 as builder

## Install build dependencies.
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y make gcc


ADD . /tinycc
WORKDIR /tinycc
RUN ./configure
RUN make
