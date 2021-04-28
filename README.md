# Xubuntu 18.04 Base image

This repo contains Packer files for building Xubuntu 18.04 Bionic Beaver desktop amd64 base image for QEMU/OpenStack and for VirtualBox/Vagrant using Gitlab CI/CD.

## Image for QEMU/OpenStack

There is one user account:

*  `ubuntu` created by [cloud-init](https://cloudinit.readthedocs.io/en/latest/), enabled for SSH

## Image for VirtualBox/Vagrant

There is one user account:

*  `vagrant` with password `vagrant`, enabled for SSH

## Known issues and requested features

See [issues](https://gitlab.ics.muni.cz/muni-kypo-images/xubuntu-18.04/-/issues).

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgements

<table>
  <tr>
    <td>![EU](figures/EU.jpg "EU emblem")</td>
    <td>
This software and accompanying documentation is part of a [project](https://cybersec4europe.eu) that has received funding from the European Union’s Horizon 2020 research and innovation programme under grant agreement No. 830929.
</td>
  </tr>
  <tr>
      <td>![TACR](figures/TACR.png "TACR logo")</td>
      <td>This software was developed with the support of the Technology Agency of the Czech Republic (TA ČR) from the National Centres of Competence programme (project identification TN01000077 – [National Centre of Competence in Cybersecurity](https://nc3.cz/)). 
      </td>
  </tr>
 </table>
