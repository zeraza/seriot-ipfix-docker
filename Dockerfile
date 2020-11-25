FROM influxdb:latest

COPY master.zip /
COPY entrypoint.sh /
COPY init-ipfix.iql /

EXPOSE 4739/udp

RUN echo "deb http://ftp.de.debian.org/debian stretch-backports main" >> /etc/apt/sources.list && \
	apt-get update && apt-get install -y unzip golang-1.11 git && \
	unzip master.zip && \
	cd ipflux-master && \
	export GOPATH=/ipflux-master && \
	export GOBIN=$GOPATH/bin && \
	mkdir bin && \
	/usr/lib/go-1.11/bin/go get ./... && \
	/usr/lib/go-1.11/bin/go install && \
	mkdir /docker-entrypoint-initdb.d && \
	mv /init-ipfix.iql /docker-entrypoint-initdb.d

ENTRYPOINT [ "/entrypoint.sh" ]
