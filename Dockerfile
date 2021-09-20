# Python Based Docker
FROM python:latest

# Installing Packages
RUN apt update && apt upgrade -y
RUN apt install git curl python3-pip ffmpeg -y

# Updating Pip Packages
RUN pip3 install -U pip

# Installing NodeJS
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    npm i -g npm


# Installing Requirements
RUN cd /
RUN pip3 install -U -r requirements.txt
RUN mkdir /VcVideoPlay
WORKDIR /VcVideoPlay
COPY start.sh /start.sh

# Running VcVideoPlayer
CMD ["/bin/bash", "/start.sh"]
