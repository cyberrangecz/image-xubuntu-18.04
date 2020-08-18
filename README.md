# xubuntu-18.04-desktop-amd64

## Introduction

This repo contains Packer files for building Xubuntu 18.04 Bionic Beaver base image for QEMU/OpenStack and for VirtualBox/Vagrant.

General requirement and instructions how to create and import created images to OpenStack/Vagrant are available in [wiki](https://gitlab.ics.muni.cz/muni-kypo-images/muni-kypo-images-wiki/-/wikis/image-packer).

## Image for QEMU/OpenStack

There is one user account:

*  `ubuntu` created by [cloud-init](https://cloudinit.readthedocs.io/en/latest/)

## Image for VirtualBox/Vagrant

There is one user account:

*  `vagrant` with password `vagrant` 

## Known issues and requested features

See [issues](https://gitlab.ics.muni.cz/muni-kypo-images/xubuntu-18.04-desktop-amd64/-/issues).
