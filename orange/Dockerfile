FROM novnc_base

# Install orange

RUN apt update \
 && apt install -y libxcb-keysyms1 libxcb-icccm4 libxcb-image0 libxcb-randr0 libxcb-render-util0 libxcb-xkb1 libxkbcommon-x11-0 libxcb-xinerama0 libxcb-xfixes0 \
 && apt autoclean && apt autoremove

RUN wget http://ftp.debian.org/debian/pool/main/x/xcb-util/libxcb-util1_0.4.0-1+b1_amd64.deb
RUN dpkg --install ./libxcb-util1_0.4.0-1+b1_amd64.deb

RUN conda create --name orange3 -y python=3.8 orange3 
RUN bash -c "source activate orange3 && pip install Orange3-Text Orange3-ImageAnalytics Orange3-Network Orange-Bioinformatics"
# RUN bash -c "conda init bash"
RUN echo 'conda activate orange3' >> /root/.bashrc
