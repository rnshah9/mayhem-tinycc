# Build Stage
FROM --platform=linux/amd64 ubuntu:20.04 as builder

## Install build dependencies.
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y make gcc

ADD . /tinycc
WORKDIR /tinycc
RUN ./configure
RUN make

RUN mkdir -p /deps
RUN ldd /tinycc/tcc | tr -s '[:blank:]' '\n' | grep '^/' | xargs -I % sh -c 'cp % /deps;'

FROM ubuntu:20.04 as package

COPY --from=builder /deps /deps
COPY --from=builder /tinycc/tcc /tinycc/tcc
ENV LD_LIBRARY_PATH=/deps
