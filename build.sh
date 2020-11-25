#!/bin/sh

set -x

docker build -t seriot-ipfix .
docker tag seriot-ipfix plasma.atriumberlin.de/seriot-ipfix

