ARG BUILD_FROM=ubuntu:latest
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

ENV LANG C.UTF-8

RUN curl -fsSL https://pkgs.tailscale.com/unstable/ubuntu/xenial.gpg | tac | tac | apt-key add - \
    && curl -fsSL https://pkgs.tailscale.com/unstable/ubuntu/xenial.list | tac | tac | tee /etc/apt/sources.list.d/tailscale.list \
    && apt-get update && apt-get install tailscale 
#sudo tailscale up


ADD entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
#CMD ["sh", "-c", "/usr/local/bin/cloudflared --no-autoupdate --config /config/cloudflared/config.yml tunnel run"] 