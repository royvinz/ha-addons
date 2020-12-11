ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Install requirements for add-on
RUN apk add --no-cache \
    coreutils=8.32-r0 \
    wget=1.20.3-r1

RUN wget -O cloudflared https://github.com/cloudflare/cloudflared/releases/download/2020.11.11/cloudflared-linux-arm64 \
  && chmod +x cloudflared

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]