#!/bin/sh

#
# setup.sh - アプリケーションのセットアップスクリプト
#   - Debianマシン上でふつうに ./setup.sh で起動すると必要なセットアップが行われる状態のもの
#   - DockerでいうところのDockerfile
#

cd $(dirname $0)

mkdir -p /opt/app/example
cp -r ./app/main.sh /opt/app/example
cp ./app/example.service /etc/systemd/system
systemctl enable example.service

