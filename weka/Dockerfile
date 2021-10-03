FROM orange_novnc

# Install orange

RUN apt update \
 && apt install -y openjdk-11-jre weka \
 && apt autoclean && apt autoremove

COPY ./home /opt/home
COPY ./icons /opt/icons

RUN apt install -y lxterminal