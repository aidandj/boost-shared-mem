FROM gcc:latest as build

LABEL description="Build container - boost-shared-mem"

RUN apt update
RUN apt install -y wget

WORKDIR /tmp
RUN wget https://dl.bintray.com/boostorg/release/1.71.0/source/boost_1_71_0.tar.bz2

WORKDIR /usr/local/
RUN tar --bzip2 -xf /tmp/boost_1_71_0.tar.bz2

WORKDIR /code
COPY ./code .

RUN mkdir out
RUN g++ -I/usr/local/boost_1_71_0 main.cpp -o out/test -lrt -pthread

FROM ubuntu:disco as runtime
 
LABEL description="Run container - boost-shared-mem"
 
# RUN apt update
# RUN apt install -y libstdc++-9-dev

RUN mkdir /boost-shared-mem
COPY --from=build /code/out/test /boost-shared-mem/test
 
WORKDIR /boost-shared-mem