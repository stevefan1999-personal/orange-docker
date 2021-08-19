FROM continuumio/miniconda3:4.10.3p0
ENV DEBIAN_FRONTEND noninteractive

RUN apt update \
 && apt install -y novnc python-websockify lxde-core tigervnc-standalone-server supervisor

COPY ./etc/supervisor /etc/supervisor


# Install orange
#RUN conda install orange3
#RUN pip install Orange3-Text Orange3-ImageAnalytics Orange3-Network Orange-Bioinformatics

CMD ["/usr/bin/supervisord", "-n"]
EXPOSE 6080