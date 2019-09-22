#!/bin/sh

CMDNAME=$(basename $0)
error() {
  printf '\e[31m%s: エラー: %s\e[m\n' "${CMDNAME}" "${1}" 1>&2
  printf '\e[31m%s: 終了します\e[m\n' "${CMDNAME}" 1>&2
  exit 1
}

if [ "$(id -u)" != "0" ]; then
  error "エラー: root権限が必要です" 1>&2
fi

apt-get -y update &&
apt-get -y install systemd-container mmdebstrap

