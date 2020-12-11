ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN mkdir /etc/cloudflared

# Install requirements for add-on
RUN apk add --no-cache  wget

#RUN wget -O cloudflared https://github.com/cloudflare/cloudflared/releases/download/2020.11.11/cloudflared-linux-arm64 \
#  && chmod +x cloudflared

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

#CMD [ "/run.sh" ]