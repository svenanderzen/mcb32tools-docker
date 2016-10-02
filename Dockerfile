################################################################################
#                                                                              #
# Dockerfile for communicating with a ChipKit Uno32 board from a Docker        #
# container.                                                                   #
#                                                                              #
# Instructions:                                                                #
# 1. Find out the TTY that the ChipKit Uno32 board is currently bound to.      #
# 2. Start the container with this information. Be sure to specify a --device  #
#    flag with the TTY information as well as to bind a working directory for  #
#    the source code.                                                          #
# 3. The container will be opened. Use docker start/stop to controll the       #
#    container and attach to attach to the running shell inside the container. #
#                                                                              #
# Example command:                                                             #
# docker run -i -t --device=/dev/ttyUSB0 -v "$PWD":/home --name mcb32tools     #
#                                                                              #
# *NOTE: All credit and licensing regarding mcb32tools goes to their           #
# respective creators.                                                         #
# https://github.com/is1200-example-projects/mcb32tools/releases/              #
#                                                                              #
################################################################################

FROM ubuntu:xenial

WORKDIR /home

RUN apt-get update && apt-get install -y \
    wget \
    bzip2 \
    make

RUN wget https://github.com/is1200-example-projects/mcb32tools/releases/download/v2.1/mcb32tools-v2.1-x86_64-linux-gnu.run
RUN chmod +x mcb32tools-v2.1-x86_64-linux-gnu.run
RUN ./mcb32tools-v2.1-x86_64-linux-gnu.run

RUN echo "source /opt/mcb32tools/environment" >> /root/.bashrc

ENTRYPOINT /bin/bash
