#!/bin/bash -x

# cleanup
apt-get -y autoremove
apt-get -y autoclean
rm -rf /var/log
history -c

