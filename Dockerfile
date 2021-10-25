FROM debian:stable-slim

ARG TIDEWAYS_ENVIRONMENT_DEFAULT=production
ENV TIDEWAYS_ENVIRONMENT=$TIDEWAYS_ENVIRONMENT_DEFAULT
ENV TIDEWAYS_DAEMON_EXTRA="--hostname=$TIDEWAYS_ENVIRONMENT_DEFAULT"

RUN apt-get update && apt-get install -yq --no-install-recommends gnupg2 curl sudo ca-certificates

RUN echo 'deb http://s3-eu-west-1.amazonaws.com/tideways/packages debian main' > /etc/apt/sources.list.d/tideways.list && \
    curl -sS 'https://s3-eu-west-1.amazonaws.com/tideways/packages/EEB5E8F4.gpg' | apt-key add -
    
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -yq tideways-daemon && \
    apt-get autoremove --assume-yes && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD run.sh /run.sh

RUN tideways-daemon -version

CMD ["/run.sh"]
