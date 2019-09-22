#!/bin/sh

cd $(dirname $0)

mkdir -p /opt/app/example
cp -r main.sh /opt/app/example
cp ./example.service /etc/systemd/system
systemctl enable example.service

