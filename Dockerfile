FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT 1

RUN apt update
RUN apt upgrade -y
RUN apt install -y wget 
RUN useradd -d /home/container -m container

RUN wget -q https://umod.io/umod-develop.sh | bash /dev/stdin

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
