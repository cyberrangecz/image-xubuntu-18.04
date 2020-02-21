#!/bin/bash -x

# disable root login using password
sudo passwd -l root

# cleanup
apt-get -y autoremove
apt-get -y autoclean
rm -rf /var/log
history -c
