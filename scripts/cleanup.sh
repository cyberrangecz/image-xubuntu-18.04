#!/bin/bash -x

# disable ssh root login using password
sed -i 's/#\?PermitRootLogin.*/PermitRootLogin without-password/g' /etc/ssh/sshd_config

# cleanup
apt-get -y autoremove
apt-get -y autoclean
rm -rf /var/log
history -c
