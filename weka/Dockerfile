FROM orange_novnc

# Install orange

RUN apt update \
 && apt install -y openjdk-11-jre weka \
 && apt autoclean && apt autoremove

COPY ./home/.config /root/.config

RUN apt install -y lxterminal