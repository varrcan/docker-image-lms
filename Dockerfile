FROM ubuntu:bionic
MAINTAINER Sergey Voloshin <git@varrcan.me>

ENV SQUEEZE_VOL /srv/squeezebox
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive
ENV DEB_URL='http://www.mysqueezebox.com/update/?version=8.0.0&revision=1&geturl=1&os=debamd64'

RUN apt-get update && \
		apt-get -y install curl wget faad flac lame sox libio-socket-ssl-perl tzdata && \
		url=$(curl "$DEB_URL" | sed 's/_all\.deb/_amd64\.deb/') && \
		curl -Lsf -o /tmp/logitechmediaserver.deb $url && \
		dpkg -i /tmp/logitechmediaserver.deb && \
		rm -f /tmp/logitechmediaserver.deb && \
		rm -rf /usr/share/squeezeboxserver/CPAN/Font && \
		apt-get autoremove && \
		apt-get clean && \
		rm -rf /var/lib/apt/lists/* \

VOLUME $SQUEEZE_VOL
EXPOSE 3483 3483/udp 9000 9090

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

