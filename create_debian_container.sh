#!/bin/sh

set -x

CMDNAME=$(basename $0)
error() {
  printf '\e[31m%s: エラー: %s\e[m\n' "${CMDNAME}" "${1}" 1>&2
  printf '\e[31m%s: 終了します\e[m\n' "${CMDNAME}" 1>&2
  exit 1
}

if [ "`id -u`" != "0" ]; then
  error "エラー: root権限が必要です" 1>&2
fi

dst="$1"

#debootstrap --include=dbus,man-db,bc,pax,ncompress,psmisc,ed,locales,ca-certificates buster "${dst}" http://cdn.debian.or.jp/debian/ || error 'ルートファイルシステムの作成に失敗しました'

tmp=$(mktemp -d)
printf 'tmp: %s\n' "${tmp}"

sudo mmdebstrap --variant=apt --include='systemd,dbus' --dpkgopt='path-exclude=/usr/share/man/*' --dpkgopt='path-exclude=/usr/share/locale/*' --dpkgopt='path-exclude=/usr/share/doc/*' --dpkgopt='path-exclude=/var/lib/apt/lists/*debian*' --dpkgopt='path-exclude=/var/cache/apt/*.bin' stable "${tmp}/root"

cp -r ./* "${tmp}/root/tmp/"
chroot "${tmp}/root" '/tmp/setup.sh'
cd "${tmp}/root/tmp/"
ls | xargs -IXXX rm -rf XXX

cd "${tmp}/root"
tar -czf "${dst}" ./

