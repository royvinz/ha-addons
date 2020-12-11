# FROM hassioaddons/base-aarch64

# #ENV LANG C.UTF-8

# # Install requirements for add-on
# RUN apk add --no-cache jq

# # Copy data for add-on
# COPY run.sh /
# RUN chmod a+x /run.sh

FROM %%BASE_IMAGE%%

# Copy root filesystem
#COPY rootfs /

# Setup base
#RUN apk add --no-cache \
#    coreutils=8.32-r0 \
#    wget=1.20.3-r1

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="ruuvitag-discovery" \
    io.hass.description="home assistant ruuvitag discovery add-on" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Balda" \
    org.label-schema.description="Home Assistant RuuviTag discovery add-on" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="ruuvitag-discovery" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="https://github.com/balda/ruuvitag-discovery" \
    org.label-schema.usage="https://github.com/balda/ruuvitag-discovery/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/balda/ruuvitag-discovery" \
    org.label-schema.vendor="Community Hass.io Addons"