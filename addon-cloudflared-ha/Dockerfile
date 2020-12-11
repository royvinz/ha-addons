ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

# Python 3 HTTP Server serves the current working dir
# So let's set it to our add-on persistent data directory.
WORKDIR /data

# Install requirements for add-on
RUN apk add --no-cache python3
RUN mkdir /etc/cloudflared \
 && curl -L -s -o cloudflared "https://github.com/cloudflare/cloudflared/releases/download/2020.11.11/cloudflared-linux-arm64"  \
 && chmod +x  cloudflared \
 && cp cloudflared /data/

CMD [ "/run.sh" ]