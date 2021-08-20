FROM continuumio/miniconda3:4.10.3p0 AS base
ENV DEBIAN_FRONTEND noninteractive

RUN apt update \
 && apt install -y novnc python-websockify lxde-core tigervnc-standalone-server supervisor gcc g++ make \
 && apt autoclean && apt autoremove

COPY ./etc/supervisor /etc/supervisor

CMD ["/usr/bin/supervisord", "-n"]
EXPOSE 6080
