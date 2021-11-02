FROM orange_novnc

# Install orange

RUN apt update \
 && apt install -y openjdk-11-jre weka \
 && apt autoclean && apt autoremove

COPY ./home /opt/home
COPY ./icons /opt/icons
COPY ./libsvm.jar /usr/share/java
RUN apt install -y lxterminal