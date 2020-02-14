#!/bin/sh -x

# install xubuntu-desktop and fix root login error
apt-get install -y xubuntu-desktop
sed -i 's/mesg n || true.*/tty -s \&\& mesg n || true/g' /root/.profile

