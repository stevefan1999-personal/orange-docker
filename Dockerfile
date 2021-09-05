FROM continuumio/miniconda3:4.10.3p0 AS base
ENV DEBIAN_FRONTEND noninteractive

RUN apt update \
 && apt install -o APT::Install-Suggests=0 -o APT::Install-Recommends=0 -y novnc python-websockify lxde-core tigervnc-standalone-server supervisor gcc g++ make lxterminal \
 && apt autoclean && apt autoremove

RUN mkdir -p /usr/share/man/man1

COPY ./novnc /usr/app/novnc
COPY ./etc/supervisor /etc/supervisor

CMD ["/usr/bin/supervisord", "-n"]
EXPOSE 6080
