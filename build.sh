#!/bin/sh

vagrant rsync &&
vagrant ssh -c 'cd /vagrant/app && sudo create_debian_container /tmp/rootfs.tar.gz' &&
mkdir -p build &&
vagrant ssh -c 'cat /tmp/rootfs.tar.gz' > build/rootfs.tar.gz
