#!/bin/bash
while [[ $# > 1 ]]
do
  key="$1"

  case $key in
      -c|--config)
    CONFIGFILE="$2"
    shift
    ;;
    *)
    # unknown option
    ;;
  esac
  shift
done

source ${CONFIGFILE}

echo DEVICE  = "${DEVICE}"
echo DEVICE SIZE = "${DEVSIZE}"
echo VERSION    = "${VERSION}"
echo OS    = "${OS}"
echo PACKAGENAME    = "${PACKAGENAME}"
echo FIRSTMDMIP    = "${FIRSTMDMIP}"
echo SECONDMDMIP    = "${SECONDMDMIP}"

# Create the file to be added to the pool. The file is thin provisioned 
truncate -s ${DEVSIZE} ${DEVICE}
yum install numactl libaio wget -y

# Downloading the latest files from EMC website
cd /vagrant
wget -nv ftp://ftp.emc.com/Downloads/ScaleIO/ScaleIO_RHEL6_Download.zip -O ScaleIO_RHEL6_Download.zip
unzip -o ScaleIO_RHEL6_Download.zip -d /vagrant/scaleio/

# Setting up the TB
cd /vagrant/scaleio/ScaleIO_1.32_RHEL6_Download
MDM_IP=${FIRSTMDMIP},${SECONDMDMIP} rpm -Uv ${PACKAGENAME}-tb-${VERSION}.${OS}.x86_64.rpm
MDM_IP=${FIRSTMDMIP},${SECONDMDMIP} rpm -Uv ${PACKAGENAME}-sds-${VERSION}.${OS}.x86_64.rpm
MDM_IP=${FIRSTMDMIP},${SECONDMDMIP} rpm -Uv ${PACKAGENAME}-sdc-${VERSION}.${OS}.x86_64.rpm

echo "Copying private key..."
cp /vagrant/vagrant.private /home/vagrant/.ssh/id_rsa
chown vagrant:vagrant /home/vagrant/.ssh/id_rsa
chmod 600 /home/vagrant/.ssh/id_rsa

if [[ -n $1 ]]; then
  echo "Last line of file specified as non-opt/last argument:"
  tail -1 $1
fi

echo "Sleeping for 30 seconds to make sure everything comes up..."
sleep 30
