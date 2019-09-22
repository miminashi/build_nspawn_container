#!/bin/sh

vagrant up &&
vagrant rsync &&
vagrant ssh -c 'sudo rm -rf /tmp/rootfs.tar.gz && cd /vagrant/ && sudo create_debian_container /tmp/rootfs.tar.gz' &&
mkdir -p build &&
vagrant ssh -c 'cat /tmp/rootfs.tar.gz' > build/rootfs.tar.gz
