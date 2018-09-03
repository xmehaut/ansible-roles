#!/bin/sh

GPGKEY=`ls /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-[0-9]*`
REPO=/etc/yum.repos.d/CentOS-Sources.repo

if [ ! -f ${REPO} ]; then
  echo '[base-source]
name=CentOS-7 - Base Sources
baseurl=http://vault.centos.org/centos/7/os/Source/
gpgcheck=0
enabled=0
gpgkey=file://GPGKEY

#released updates
[updates-source]
name=CentOS-7 - Updates Sources
baseurl=http://vault.centos.org/centos/7/updates/Source/
gpgcheck=0
enabled=0
gpgkey=file://GPGKEY

#additional packages that may be useful
[extras-source]
name=CentOS-7 - Extras Sources
baseurl=http://vault.centos.org/centos/7/extras/Source/
gpgcheck=0
enabled=0
gpgkey=file://GPGKEY

#additional packages that extend functionality of existing packages
[centosplus-source]
name=CentOS-7 - Plus Sources
baseurl=http://vault.centos.org/centos/7/centosplus/Source/
gpgcheck=O
enabled=0
gpgkey=file://GPGKEY
' | sudo tee ${REPO} > /dev/null
  sudo sed -i -e "s;gpgkey=file://GPGKEY;gpgkey=file://${GPGKEY};g" ${REPO}
fi