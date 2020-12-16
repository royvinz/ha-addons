FROM hassioaddons/ubuntu-base-aarch64:latest

ENV LANG C.UTF-8

#RUN wget https://pkgs.tailscale.com/stable/tailscale_1.2.10_arm64.tgz \


RUN apt-get update && apt-get upgrade -y && apt-get -y install gnupg\
    && curl -fsSL https://pkgs.tailscale.com/unstable/ubuntu/xenial.gpg | tac | tac | apt-key add - \
    && curl -fsSL https://pkgs.tailscale.com/unstable/ubuntu/xenial.list | tac | tac | tee /etc/apt/sources.list.d/tailscale.list \
    && apt-get update && apt-get -y install tailscale 
#sudo tailscale up


#ADD entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh
#RUN chmod u+x /config/tailscale/start.sh
ENTRYPOINT ["/entrypoint.sh"]
#CMD ["sh", "-c", "/usr/local/bin/cloudflared --no-autoupdate --config /config/cloudflared/config.yml tunnel run"] 