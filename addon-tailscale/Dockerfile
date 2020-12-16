FROM golang:alpine 

# Add prequisites
RUN apk add --no-cache ca-certificates \
        git \
        gcc \
        build-base \
        iptables \
        iproute2

WORKDIR /go/src/tailscale

# Fetch go code
RUN git clone https://github.com/tailscale/tailscale.git \
    && cd tailscale/ \
    && go clean \
    && go get tailscale.com/cmd/tailscale{,d} \
    && make tailscale \
    && mv tailscale /usr/local/bin/tailscale \
    && chmod +x /usr/local/bin/tailscale \
    && cd /etc \
    && ln -s /config/tailscale tailscale

ADD entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["sh", "-c", "/usr/local/bin/cloudflared --no-autoupdate --config /config/cloudflared/config.yml tunnel run"] 