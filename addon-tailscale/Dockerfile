# FROM hassioaddons/ubuntu-base-aarch64:latest

# ENV LANG C.UTF-8

# #RUN wget https://pkgs.tailscale.com/stable/tailscale_1.2.10_arm64.tgz \


# RUN apt-get update && apt-get upgrade -y && apt-get -y install gnupg\
#     && curl -fsSL https://pkgs.tailscale.com/unstable/ubuntu/xenial.gpg | tac | tac | apt-key add - \
#     && curl -fsSL https://pkgs.tailscale.com/unstable/ubuntu/xenial.list | tac | tac | tee /etc/apt/sources.list.d/tailscale.list \
#     && apt-get update && apt-get -y install tailscale 
# #sudo tailscale up


# ADD entrypoint.sh /entrypoint.sh
# RUN chmod u+x /entrypoint.sh
# #RUN chmod u+x /config/tailscale/start.sh
# ENTRYPOINT ["/entrypoint.sh"]
# #CMD ["sh", "-c", "/usr/local/bin/cloudflared --no-autoupdate --config /config/cloudflared/config.yml tunnel run"] 

FROM golang:alpine 

WORKDIR /go/src/tailscale

# Add prequisites
RUN apk add --no-cache ca-certificates \
        git \
        gcc \
        build-base \
        iptables

RUN git clone https://github.com/tailscale/tailscale.git \
    && cd tailscale \
    && go get tailscale.com/cmd/tailscale \
    && go get tailscale.com/cmd/tailscaled \
    && ./build_dist.sh tailscale.com/cmd/tailscale \
    && ./build_dist.sh tailscale.com/cmd/tailscaled 

# Fetch go code

#RUN ./build_dist.sh tailscale.com/cmd/tailscale \
 #   && ./build_dist.sh tailscale.com/cmd/tailscaled 
    #&& cd tailscale/ \
    #&& go clean 
    #&& go get github.com/cloudflare/cloudflared/cmd/cloudflared \
    #&& make cloudflared \
    #&& mv cloudflared /usr/local/bin/cloudflared \
    #&& chmod +x /usr/local/bin/cloudflared \
    #&& cd /etc \
    #&& ln -s /config/cloudflared cloudflared

ADD entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh 
# #RUN chmod u+x /config/tailscale/start.sh
ENTRYPOINT ["/entrypoint.sh"]
# #CMD ["sh", "-c", "/usr/local/bin/cloudflared --no-autoupdate --config /config/cloudflared/config.yml tunnel run"] 