FROM continuumio/miniconda3:4.10.3p0
ENV DEBIAN_FRONTEND noninteractive

USER root
# Desktop environment

# Create user
ENV USER orange
ENV PASSWORD orange
ENV HOME /home/${USER}
ENV CONDA_DIR /home/${USER}/.conda

RUN useradd -m -s /bin/bash ${USER}
RUN echo "${USER}:${PASSWORD}" | chpasswd
RUN gpasswd -a ${USER} sudo

USER $USER
WORKDIR ${HOME}

# Install orange
RUN conda install orange3
RUN pip install Orange3-Text Orange3-ImageAnalytics Orange3-Network Orange-Bioinformatics
USER root

# Fix permissions
RUN mkdir ${HOME}/share
RUN chown -R $USER:$USER /home/orange/.config /home/orange/Desktop /home/orange/install /home/$USER/share
ADD ./etc/sudoers /etc/sudoers 

CMD ["/usr/bin/supervisord", "-n"]
