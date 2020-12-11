ARG BUILD_FROM
FROM tianon/raspbian:${BUILD_FROM}-slim

# Set shell
#SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

# Python 3 HTTP Server serves the current working dir
# So let's set it to our add-on persistent data directory.
WORKDIR /data

# Install requirements for add-on
RUN apt-get update
RUN apt-get install -y python-qt4
RUN apt-get install -y python-pyside
RUN apt-get install -y python-pip
RUN apt-get install -y python3-pip
RUN apt-get install -y python3-pyqt5
# RUN mkdir /etc/cloudflared \
#  && curl -L -s -o cloudflared "https://github.com/cloudflare/cloudflared/releases/download/2020.11.11/cloudflared-linux-arm64"  \
#  && chmod +x  cloudflared \
#  && cp cloudflared /opt/cloudflared \
#  && chmod +x /opt/cloudflared

COPY rootfs /

CMD [ "/run.sh" ]