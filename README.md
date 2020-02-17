# xubuntu-18.04-desktop-amd64

## Introduction

Xubuntu 18.04 Bionic Beaver base image for KYPO and Vagrant built from ISO.

It contains Packer files for building Xubuntu Linux base image for QEMU and for VirtualBox/Vagrant.

General instructions how to create and import created images to OpenStack
are available in KYPO2 project [wiki](https://gitlab.ics.muni.cz/kypo2/kypo2-project/wikis/images-openstack).

## Requirements

* [packer](http://www.packer.io/downloads.html) (tested at 1.4.1)

### To run QEMU
* QEMU (tested at v 4.0.0)

### To run VirtualBox/Vagrant
* Python 3
* [VirtualBox 6](https://www.virtualbox.org/wiki/Download_Old_Builds_6_0)
* [Vagrant 2.2.5](https://www.vagrantup.com/downloads.html)

### Ubuntu:
```
sudo apt install qemu-kvm virt-manager virt-viewer libvirt-bin ebtables gir1.2-spiceclientgtk-3.0 libguestfs-tools python3 virtualbox vagrant
```

### MacOS:
```
brew install qemu
brew install packer
```
Note: `brew install qemu --with-sdl` or `brew install qemu --with-sdl2` is not supported anymore.
Note: Missing commands to install Python, VirtualBox and Vagrant.

## Info about the build

There are two or three user accounts:

*  "root" with password "toor"
*  "debian" created by [cloud-init](https://cloudinit.readthedocs.io/en/latest/)
*  "vagrant" with password "vagrant" according to [vagrant documentation](https://www.vagrantup.com/docs/boxes/base.html#quot-vagrant-quot-user)

vagrant user is only created for the VirtualBox/Vagrant box. 

SSH server is enabled. User "debian" can be used for SSH via key pair used for
instantiation of the machine.

## Usage

### QEMU

At Linux, add `"accelerator": "kvm"` to QEMU builder configuration in `xubuntu.json`. 
Building might be faster than approx. 1 hour with the default accelerator. 

```bash
# start the installation
packer build -only=xubuntu-qemu xubuntu.json
# run locally
qemu-system-x86_64-spice -accel kvm -m size=4096 target-qemu/xubuntu
# run in OpenStack
# import image to OpenStack
openstack image create --file target-qemu/xubuntu --property hw_scsi_model=virtio-scsi --property hw_disk_bus=scsi --property hw_rng_model=virtio --property hw_qemu_guest_agent=yes --property os_require_quiesce=yes --property os_type=linux --property os_distro=ubuntu xubuntu-amd64
# create server on OpenStack
openstack server create --image b13b62af-6b6f-4f7c-a08b-fd7e0d263fe8 --flavor csirtmu.small2x4 --network d2fe6d71-c0c7-428f-84a8-84d8b7430bda xubuntu
# get server console url
openstack console url show xubuntu --spice
```

### VBox/Vagrant
```bash
# start the installation
packer build -only=xubuntu-vbox xubuntu.json
# add box to vagrant
vagrant box add --name xubuntu target-vbox/xubuntu.box
```

Now xubuntu can be used in Vagrantfile as a name of a box.

Note: Creating both boxes is possible using `packer build -parallel=false xubuntu.json`

Note: In case downloading ISO fails with 404, iso_url in xubuntu.json needs to be updated to newer version

## TODO

* make two Packer templates: one for Linux and the other for Mac (to handle OS-specific settings)
* [logging to console](https://docs.openstack.org/image-guide/openstack-images.html#ensure-image-writes-boot-log-to-console) to see boot logs in OpenStack
* tweak cloud-init config according to [OpenStack image requirements]https://docs.openstack.org/image-guide/openstack-images.html
* add swap partition on boot using [cloud-init](https://cloudinit.readthedocs.io/en/latest/topics/modules.html?highlight=swap#mounts)
* CI for building and storing the images? Each push to our lab git
repository will trigger a CI job that will build both QEMU and VMware and store
them on the GitLab server where user can download them via GitLab Web UI.

## Known Issues

* Not tested in OpenStack yet.
* See Packer builder template for comments about building the images at MacOS.
