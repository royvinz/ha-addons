# FROM hassioaddons/base-aarch64

# #ENV LANG C.UTF-8

# # Install requirements for add-on
# RUN apk add --no-cache jq

# # Copy data for add-on
# COPY run.sh /
# RUN chmod a+x /run.sh

# CMD [ "/run.sh" ]
ARG BUILD_FROM=hassioaddons/base:8.0.3
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

ENV LANG C.UTF-8

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]