
##ARG BUILD_FROM=hassioaddons/armhf-base-raspbian
# hadolint ignore=DL3006
#FROM ${BUILD_FROM}
FROM balenalib/generic-armv7ahf-debian-golang:latest


# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

# Python 3 HTTP Server serves the current working dir
# So let's set it to our add-on persistent data directory.
WORKDIR /data

# Install requirements for add-on
#UN apk add python3
RUN mkdir /etc/cloudflared \
  && curl -L -s -o cloudflared "https://github.com/cloudflare/cloudflared/releases/download/2020.11.11/cloudflared-linux-arm64"  \
  && cp cloudflared /usr/bin/cloudflared \
  && chmod +x /usr/bin/cloudflared

COPY rootfs /

CMD [ "/run.sh" ]