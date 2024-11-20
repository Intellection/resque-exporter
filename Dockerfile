FROM ubuntu:24.04 AS builder

ARG DEBIAN_FRONTEND=noninteractive
ARG TARGETARCH
ARG TARGETOS

RUN apt-get update -qq -y && \
    apt-get install --no-install-recommends -qq -y \
      ca-certificates \
      wget && \
    rm -rf /var/lib/apt/lists/*

ARG RESQUE_EXPORTER_VERSION
ARG RESQUE_EXPORTER_PKG="resque-exporter-${RESQUE_EXPORTER_VERSION}-${TARGETOS}-${TARGETARCH}.tar.gz"
RUN cd /tmp/ && \
    wget --progress=dot:giga https://github.com/Intellection/resque-exporter/releases/download/${RESQUE_EXPORTER_VERSION}/${RESQUE_EXPORTER_PKG} && \
    wget --progress=dot:giga https://github.com/Intellection/resque-exporter/releases/download/${RESQUE_EXPORTER_VERSION}/${RESQUE_EXPORTER_PKG}.sha256 && \
    echo "$(cat ${RESQUE_EXPORTER_PKG}.sha256) *${RESQUE_EXPORTER_PKG}" | sha256sum -c - && \
    tar --no-same-owner -xzf ${RESQUE_EXPORTER_PKG}

FROM ubuntu:24.04

COPY --from=builder /tmp/resque-exporter /bin/resque-exporter

USER nobody:nogroup
EXPOSE 9447
ENTRYPOINT ["/bin/resque-exporter"]
