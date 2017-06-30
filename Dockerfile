FROM debian:9
MAINTAINER tolookat.me

RUN set -x && \
    apt-get update && \
    apt-get install -y dnscrypt-proxy haveged

RUN set -x && \
    apt-get autoremove -y && \
    apt-get clean

ENV LISTEN_ADDR 0.0.0.0:53
ENV RESOLVER_NAME dnscrypt.eu-nl
ENV LOGLEVEL 6
ENV EDNS_PAYLOAD_SIZE 1252
ENV EPHEMERAL "--ephemeral-keys"

EXPOSE 53/tcp 53/udp

CMD which dnscrypt-proxy

CMD dnscrypt-proxy \
                   --local-address=$LISTEN_ADDR \
                   --resolver-name=$RESOLVER_NAME \
                   --loglevel=$LOGLEVEL \
                   --edns-payload-size=$EDNS_PAYLOAD_SIZE \
                   $EPHEMERAL
#
