FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt update
RUN apt upgrade -y
RUN apt install -y curl wget 
RUN useradd -d /home/container -m container

RUN curl -sSL https://umod.io/umod-develop.sh | bash /dev/stdin
RUN source ~/.profile

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]