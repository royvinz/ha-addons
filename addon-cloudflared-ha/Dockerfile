# FROM hassioaddons/base-aarch64

# #ENV LANG C.UTF-8

# # Install requirements for add-on
# RUN apk add --no-cache jq

# # Copy data for add-on
# COPY run.sh /
# RUN chmod a+x /run.sh

ARG BUILD_FROM=hassioaddons/base:8.0.3
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Copy root filesystem
#COPY rootfs /

# Setup base
RUN apk add --no-cache \
    coreutils=8.32-r0 \
    wget=1.20.3-r1

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION