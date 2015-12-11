#!/bin/bash
while [[ $# > 1 ]]
do
  key="$1"

  case $key in
    -v|--version)
    VERSION="$2"
    shift
    ;;
    -n|--packagename)
    PACKAGENAME="$2"
    shift
    ;;
    *)
    # unknown option
    ;;
  esac
  shift
done

echo VERSION    = "${VERSION}"
echo PACKAGENAME    = "${PACKAGENAME}"

yum install numactl libaio java-1.8.0-openjdk.x86_64 xorg-x11-xauth -y

# Downloading the latest files from EMC website
cd /vagrant
wget -nv ftp://ftp.emc.com/Downloads/ScaleIO/ScaleIO_RHEL6_Download.zip -O ScaleIO_RHEL6_Download.zip
unzip -o ScaleIO_RHEL6_Download.zip -d /vagrant/scaleio/

# Installing the GUI Package
cd /vagrant/scaleio/ScaleIO_1.32_GUI_for_Linux_Download
rpm -Uv ${PACKAGENAME}-gui-${VERSION}.noarch.rpm

echo "Copying private key to vagrant user..."
cp /vagrant/vagrant.private /home/vagrant/.ssh/id_rsa
chown vagrant:vagrant /home/vagrant/.ssh/id_rsa
chmod 600 /home/vagrant/.ssh/id_rsa

echo "Copying private key to root user..."
mkdir /root/.ssh
cp /vagrant/vagrant.private /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa

if [[ -n $1 ]]; then
  echo "Last line of file specified as non-opt/last argument:"
  tail -1 $1
fi
