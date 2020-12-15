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
    #&& mkdir /etc/cloudflared
    && cd /etc \
    && ln -s /config/cloudflared cloudflared


#RUN go get -v github.com/cloudflare/cloudflared/cmd/cloudflared

# Set working directory and build
#WORKDIR /go/src/github.com/cloudflare/cloudflared/cmd/cloudflared
#RUN CGO_ENABLED=0 \
#    GOOS=linux \
#    go build \
#    -o /go/bin/app \
#    -ldflags '-w -s -extldflags "-static"' \
#    /go/src/github.com/cloudflare/cloudflared/cmd/cloudflared
#RUN chmod u+x /go/bin/app

# Setup our scratch container

#__CROSS_COPY qemu/qemu-__QEMU_ARCH__-static /usr/bin/
#COPY --from=builder /go/bin/app /usr/local/bin/cloudflared
#COPY --from=builder /etc/ssl/certs/ /etc/ssl/certs/
COPY rootfs / 
ADD entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
#CMD ["sh", "-c", "/usr/local/bin/cloudflared tunnel --no-tls-verify --origincert /config/cert/cert.pem --config /config/cloudflared/config.yml"] 
CMD ["sh", "-c", "/usr/local/bin/cloudflared --config /config/cloudflared/config.yml tunnel run"] 