ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

RUN curl -fsSL https://pkgs.tailscale.com/unstable/ubuntu/xenial.gpg | tac | tac | sudo apt-key add - \
    && curl -fsSL https://pkgs.tailscale.com/unstable/ubuntu/xenial.list | | tac | tac | sudo tee /etc/apt/sources.list.d/tailscale.list \
    && sudo apt-get update && sudo apt-get install tailscale 
#sudo tailscale up


ADD entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
#CMD ["sh", "-c", "/usr/local/bin/cloudflared --no-autoupdate --config /config/cloudflared/config.yml tunnel run"] 