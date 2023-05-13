FROM nvidia/cuda:12.1.1-cudnn8-runtime-ubuntu22.04

MAINTAINER "Daphne Cornelisse <cornelisse.daphne@nyu.edu>"

ENV LC_ALL=C
ENV LANG=C.UTF-8
ENV TZ="America/New_York"

# Change time zone to EST
RUN apt-get -y update && \
    apt-get -y install tzdata && \
    rm -rf /etc/localtime && \
    cp -rp /usr/share/zoneinfo/EST /etc/localtime

ENV SFML_DIR /usr/share/SFML

RUN apt-get update && apt-get install -y \
    cmake \
    g++ \
    git \
    libsfml-dev \
    python3-dev \
    python3-pip \
    python3.10-venv \
    && apt upgrade -y \
    && apt-get -y clean

RUN pip3 install -U pip
