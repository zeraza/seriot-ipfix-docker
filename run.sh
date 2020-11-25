#!/bin/sh

docker run -d --restart always -v `pwd`/db:/var/lib/influxdb --name ipfix -p4739:4739/udp seriot-ipfix influxd
