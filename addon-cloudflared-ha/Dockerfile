FROM golang:alpine 

# Add prequisites
RUN apk add --no-cache ca-certificates \
        git \
        gcc \
        build-base 

# Fetch go code
RUN git clone https://github.com/cloudflare/cloudflared.git \
    && cd cloudflared/ \
    && go clean \
    && go get github.com/cloudflare/cloudflared/cmd/cloudflared \
    && make cloudflared \
    && mv cloudflared /usr/local/bin/cloudflared \
    && chmod +x /usr/local/bin/cloudflared \
    && cd /etc \
    && ln -s /config/cloudflared cloudflared

ADD entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
#CMD ["sh", "-c", "/usr/local/bin/cloudflared tunnel --no-tls-verify --origincert /config/cert/cert.pem --config /config/cloudflared/config.yml"] 
CMD ["sh", "-c", "/usr/local/bin/cloudflared --no-autoupdate --config /config/cloudflared/config.yml tunnel run"] 