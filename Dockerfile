FROM ubuntu:18.04

ENV BIND_VERSION 1:9.11.3+dfsg-1ubuntu1.1

RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
						bind9=${BIND_VERSION} \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /etc/bind

COPY named.conf.options named.conf.options

EXPOSE 53/udp

CMD [ "/usr/sbin/named", "-4", "-u", "bind", "-g" ]
